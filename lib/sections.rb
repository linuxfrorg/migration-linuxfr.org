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
    title = topic[:topic].strip
    ROR[:sections].insert(
      :id                 => topic[:id],
      :state              => state,
      :title              => title,
      :image_file_name    => "#{title}.png",
      :image_content_type => "image/png",
      :image_file_size    => File.stat("templeet/images/section/#{title}.png").size,
      :image_updated_at   => 'NOW()'.lit,
      :created_at         => 'NOW()'.lit,
      :updated_at         => 'NOW()'.lit
    )
  end
end

puts "\n\n"
