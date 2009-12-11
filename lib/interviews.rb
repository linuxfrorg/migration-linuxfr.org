##
# Interviews -> Interviews & Nodes
#
# Gotchas
#   Les interviews templeet est au format HTML, alors qu'on utilise la syntaxe wiki coté Rails
#


puts "\n____( Interviews )______________________________________________________________\n"

ROR.transaction do
  sql = <<-EOS
  SELECT e.id, e.user_id, e.target, e.description, e.timestamp, e.assignee,
         i.score, i.interest
    FROM interviews AS e
    JOIN interest   AS i ON e.id = i.res_id
   WHERE res_type = ?
  EOS
  TPL.fetch(sql, ResTypes.index('interview')) do |interview|
    $stdout.print '.' if interview[:id] % 100 == 0
    ROR[:interviews].insert(
      :id         => interview[:id],
      :state      => 'published',
      :title      => interview[:target].strip,
      :body       => interview[:body],
      :wiki_body  => wikify(interview[:description]),
      :news_id    => interview[:news_id],
      :assigned_to_user_id => interview[:assignee],
      :created_at => interview[:timestamp],
      :updated_at => interview[:timestamp]
    )
    ROR[:nodes].insert(
      :content_id   => interview[:id],
      :content_type => 'Interview',
      :score        => interview[:score],
      :user_id      => interview[:user_id],
      :public       => true,
      :created_at   => interview[:timestamp],
      :updated_at   => interview[:timestamp]
    )
  end
end

puts "\n\n"
