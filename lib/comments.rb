# encoding: utf-8
##
# Comments -> Comments
#
# Gotchas
#   Construire le materialized path d'un commentaire est compliqué
#   C'est la plus grosse table (+ d'un million de commentaires)
#   Il faut convertir les (res_type, news_id) en node_id
#


puts "\n____( Comments )________________________________________________________________\n"
puts "/!\\ Attention, ça va être long /!\\"

$parent_id = Array.new(1_200_000)
$user_id   = Array.new(1_200_000)
TPL[:comments].select(:id, :user_id, :com_parent).each do |comment|
  id = comment[:id]
  $parent_id[id] = comment[:com_parent]
  $user_id[id]   = comment[:user_id]
end
$stdout.print '.'

def answered_to_self(comment)
  user_id = $user_id[comment[:id]]
  com_id  = $parent_id[comment[:id]]
  while com_id != 0
    return true if $user_id[com_id] == user_id
    com_id = $parent_id[com_id]
  end
  false
end

def materialized_path(comment)
  path = ""
  com_id  = comment[:id]
  while com_id != 0
    path   = "%012d#{path}" % com_id
    com_id = $parent_id[com_id]
  end
  path
end

class NodeId
  def initialize
    @cache = {}
  end

  def for(type, id)
    key = "#{type}/#{id}"
    return @cache[key] if @cache.has_key?(key)
    @cache[key] = ROR[:nodes].filter(:content_type => type, :content_id => id).get(:id)
  end
end


ROR.transaction do
  nid = NodeId.new
  comments = TPL[:comments].select(:id, :subject, :body, :timestamp, :news_id, :res_type, :deleted, :score)
  comments.each do |comment|
    id      = comment[:id]
    restype = ResTypes[comment[:res_type]]
    node_id = nid.for(restype, comment[:news_id])
    next unless node_id
    state   = comment[:deleted] == 0 ? 'published' : 'deleted'
    to_self = answered_to_self(comment)
    path    = materialized_path(comment)
    ROR[:comments].insert(
      :id                => id,
      :node_id           => node_id,
      :user_id           => $user_id[id],
      :state             => state,
      :title             => no_tags(comment[:subject]),
      :body              => comment[:body].force_encoding('utf-8'),
      :wiki_body         => wikify(comment[:body]),
      :score             => comment[:score],
      :answered_to_self  => to_self,
      :materialized_path => path,
      :created_at        => comment[:timestamp],
      :updated_at        => comment[:timestamp]
    )
    $stdout.print '.' if id % 1000 == 0
    nid = NodeId.new  if id % 30000 == 0
  end
end


ROR.execute <<EOS
UPDATE nodes SET
  last_commented_at = (
    SELECT MAX(comments.created_at)
      FROM comments
     WHERE comments.node_id = nodes.id
  ),
  comments_count = (
    SELECT COUNT(*)
      FROM comments
     WHERE comments.node_id = nodes.id
  );
EOS

puts "\n\n"
