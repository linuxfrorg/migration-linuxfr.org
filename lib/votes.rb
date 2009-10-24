##
# Contents_scored -> Votes
#
# Gotchas
#   Convertir les (res_type, res_id) en node_id
#


puts "\n____( Votes )___________________________________________________________________\n"

ROR.transaction do
  TPL[:contents_scored].each do |vote|
    restype = ResTypes[vote[:res_type]]
    node_id = ROR[:nodes].filter(:content_type => restype, :content_id => vote[:res_id]).get(:id)
    next unless node_id
    ROR[:votes].insert(
      :user_id    => vote[:user_id],
      :node_id    => node_id,
      :vote       => vote[:score] == 1,
      :created_at => vote[:timestamp]
    )
  end
end

puts "\n\n"
