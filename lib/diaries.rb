##
# Users_journal -> Diaries & Nodes
#
# Gotchas
#   Les journaux templeet est au format HTML, alors qu'on utilise la syntaxe wiki coté Rails
#   La version Rails ne fait plus la distinction entre première et seconde page
#


puts "\n____( Diaries )_________________________________________________________________\n"

ROR.transaction do
  sql = <<-EOS
  SELECT d.id, d.user_id, d.subject, d.body, d.timestamp,
         i.score, i.interest
    FROM users_journal AS d
    JOIN interest      AS i ON d.id = i.res_id
   WHERE res_type = ?
  EOS
  TPL.fetch(sql, ResTypes.index('diary')) do |diary|
    $stdout.print '.' if diary[:id] % 100 == 0
    ROR[:diaries].insert(
      :id         => diary[:id],
      :state      => 'published',
      :title      => diary[:subject],
      :owner_id   => diary[:user_id],
      :body       => diary[:body],
      :created_at => diary[:timestamp],
      :updated_at => diary[:timestamp]
    )
    ROR[:nodes].insert(
      :content_id   => diary[:id],
      :content_type => 'Diary',
      :score        => diary[:score],
      :interest     => diary[:interest],
      :user_id      => diary[:user_id],
      :public       => true,
      :created_at   => diary[:timestamp],
      :updated_at   => diary[:timestamp]
    )
  end
end

puts "\n\n"
