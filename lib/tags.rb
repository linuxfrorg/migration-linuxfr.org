# encoding: utf-8
##
# Sections -> Tags
#
# Gotchas
#

puts "\n____( Tags )____________________________________________________________________\n"

ROR.transaction do
  TPL[:sections].select(:id, :section).each do |section|
    name = section[:section].strip.force_encoding('utf-8').downcase
    name.tr!(' ', '_')
    id = ROR[:tags].insert(
      :id             => section[:id],
      :name           => name,
      :taggings_count => 0
    )
  end

  count = Hash.new(0)
  nodes = ROR[:nodes].filter(:content_type => 'News').select(:id, :content_id)
  nodes.each do |node|
    section_id = TPL[:news].filter(:id => node[:content_id]).get(:section_id)
    ROR[:taggings].insert(
      :tag_id  => section_id,
      :node_id => node[:id],
      :user_id => 1,
      :created_at => 'NOW()'.lit
    )
    count[section_id] += 1
  end

  count.each do |id,count|
    ROR[:tags][:id => id] = { :taggings_count => count }
  end
end

puts "\n\n"
