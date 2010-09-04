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
    id    = diary[:id]
    title = diary[:subject].strip
    title = id.to_s if title == ''
    title = "(#{id}) #{title}" if [4, 303, 1074, 1302, 1825, 3611, 4384, 6232, 9055, 10357, 18512, 24755].include?(id)
    body  = wikify(diary[:body])
    body  = title if body == ''
    $stdout.print '.' if id % 100 == 0
    ROR[:diaries].insert(
      :id             => id,
      :title          => title,
      :owner_id       => diary[:user_id],
      :body           => diary[:body],
      :truncated_body => truncate_html(body),
      :wiki_body      => body,
      :created_at     => diary[:timestamp],
      :updated_at     => diary[:timestamp]
    )
    ROR[:nodes].insert(
      :content_id   => id,
      :content_type => 'Diary',
      :score        => diary[:score],
      :user_id      => diary[:user_id],
      :public       => 1,
      :created_at   => diary[:timestamp],
      :updated_at   => diary[:timestamp]
    )
  end
end

puts "\n\n"
