# encoding: utf-8
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
    RED.set("nodes/#{node_id}/votes/#{vote[:user_id]}", vote[:score])
    RED.expire("nodes/#{node_id}/votes/#{vote[:user_id]}", 7776000)
  end
end

puts "\n\n"
