# encoding: utf-8
##
# Topics -> Sections
#
# Gotchas
#   Il faut importer les images
#

puts "\n____( Topics )__________________________________________________________________\n"

ROR.transaction do
  TPL[:topics].select(:id, :topic, :state).each do |topic|
    state = topic[:state].to_i == 0 ? 'archived' : 'published'
    title = topic[:topic].strip.force_encoding('utf-8')
    ROR[:sections].insert(
      :id                 => topic[:id],
      :state              => state,
      :title              => title,
      :created_at         => 'NOW()'.lit,
      :updated_at         => 'NOW()'.lit
    )
  end
end

puts "\n\n"
