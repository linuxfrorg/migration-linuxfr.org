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
    RED.set("comments/#{relevance[:user_id]}/votes/#{relevance[:user_id]}", relevance[:score])
    RED.expire("comments/#{relevance[:user_id]}/votes/#{relevance[:user_id]}", 7776000)
  end
end

puts "\n\n"
