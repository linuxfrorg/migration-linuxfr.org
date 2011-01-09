# encoding: utf-8
##
# Forums_data -> Posts & Nodes
#
# Gotchas
#   Les posts templeet est au format HTML, alors qu'on utilise la syntaxe wiki coté Rails
#


puts "\n____( Posts )___________________________________________________________________\n"

ROR.transaction do
  sql = <<-EOS
  SELECT p.id, p.user_id, p.subject, p.body, p.timestamp, p.group_id,
         i.score, i.interest
    FROM forums_data AS p
    JOIN interest    AS i ON p.id = i.res_id
   WHERE res_type = ?
  EOS
  TPL.fetch(sql, ResTypes.index('post')) do |post|
    id = post[:id]
    title = no_tags(post[:subject])
    title = id.to_s if title == ''
    body  = wikify(post[:body])
    body  = title if body == ''
    $stdout.print '.' if id % 100 == 0
    ROR[:posts].insert(
      :id             => id,
      :title          => title,
      :body           => $sanitizer.sanitize(nl2br(post[:body])),
      :wiki_body      => body,
      :truncated_body => truncate_html(post[:body]),
      :forum_id       => post[:group_id],
      :created_at     => post[:timestamp],
      :updated_at     => post[:timestamp]
    )
    ROR[:nodes].insert(
      :content_id   => id,
      :content_type => 'Post',
      :score        => post[:score],
      :user_id      => post[:user_id],
      :public       => 1,
      :created_at   => post[:timestamp],
      :updated_at   => post[:timestamp]
    )
  end
end

puts "\n\n"
