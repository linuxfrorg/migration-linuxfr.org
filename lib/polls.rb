##
# Poll_questions -> Polls & Nodes
# Poll_answers -> Poll_answers
#
# Gotchas
#   Le status des sondages est archived, sauf le plus récent qui est published
#


puts "\n____( Polls )___________________________________________________________________\n"

ROR.transaction do
  sql = <<-EOS
  SELECT p.id, p.user_id, p.question, p.timestamp,
         i.score, i.interest
    FROM poll_questions AS p
    JOIN interest       AS i ON p.id = i.res_id
   WHERE res_type = ?
     AND state = 1
  EOS
  TPL.fetch(sql, ResTypes.index('poll')) do |poll|

    # Question
    ROR[:polls].insert(
      :id         => poll[:id],
      :state      => 'archived',
      :title      => poll[:question],
      :created_at => poll[:timestamp],
      :updated_at => poll[:timestamp]
    )
    ROR[:nodes].insert(
      :content_id   => poll[:id],
      :content_type => 'Poll',
      :score        => poll[:score],
      :interest     => poll[:interest],
      :user_id      => poll[:user_id],
      :public       => true,
      :created_at   => poll[:timestamp],
      :updated_at   => poll[:timestamp]
    )

    # Answers
    TPL[:poll_answers].filter(:question_id => poll[:id]).each do |answer|
      ROR[:poll_answers].insert(
        :poll_id    => poll[:id],
        :answer     => answer[:answer],
        :votes      => answer[:number],
        :position   => answer[:answer_nb]
      )
    end
  end

  recent = TPL[:poll_questions].where('state = 1').max(:id)
  ROR[:polls][:id => recent] = { :state => 'published' }
end

puts "\n\n"
