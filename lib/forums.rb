##
# Forums_group -> Forums
#
# Gotchas
#   Les posts templeet est au format HTML, alors qu'on utilise la syntaxe wiki coté Rails
#

puts "\n____( Forums )__________________________________________________________________\n"

ROR.transaction do
  position = 0
  forums = TPL[:forums_group].order('parent_id'.lit).where('parent_id != 0')
  forums.each do |forum|
    state = 'active'
    parent_name = TPL[:forums_group].where('id = ?', forum[:parent_id]).get(:name)
    name = [parent_name, forum[:name]].join('.')
    ROR[:forums].insert(
      :id         => forum[:id],
      :state      => state,
      :title      => name.strip,
      :position   => position,
      :created_at => 'NOW()'.lit,
      :updated_at => 'NOW()'.lit
    )
    position += 1
  end
end

puts "\n\n"
