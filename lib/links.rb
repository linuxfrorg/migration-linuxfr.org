# encoding: utf-8
##
# News_urls -> Links
#
# Gotchas
#   Attention à la langue
#

puts "\n____( Links )___________________________________________________________________\n"

ROR.transaction do
  TPL[:news_urls].each do |link|
    $stdout.print '.' if link[:id] % 1000 == 0
    ROR[:links].insert(
      :id         => link[:id],
      :news_id    => link[:news_id],
      :title      => no_tags(link[:name]),
      :url        => no_tags(link[:url]),
      :lang       => lang(link[:lang_id]),
      :created_at => 'NOW()'.lit,
      :updated_at => 'NOW()'.lit
    )
  end
end

puts "\n\n"
