##
# Comments_scored_user -> Relevances
#
# Gotchas
#   On importe unique les avis des 31 derniers jours
#


puts "\n____( Relevances )______________________________________________________________\n"

ROR.transaction do
  relevances = TPL[:comments_scored_user].filter('timestamp < ?', Time.now - (31 * 24 * 60 * 60))
  relevances.each do |relevance|
    ROR[:relevances].insert(
      :user_id    => relevance[:user_id],
      :comment_id => relevance[:comments_id],
      :vote       => relevance[:score] == 1,
      :created_at => relevance[:timestamp]
    )
  end
end

puts "\n\n"
