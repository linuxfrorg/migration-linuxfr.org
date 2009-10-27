##
# Users -> Users & Accounts
#
# Gotchas
#   le user 1 est anonyme, avec des données qui explosent sequel
#   le status à 0 correspond à des utilisateurs pas encore validés
#

puts "\n____( Users )___________________________________________________________________\n"

ROR.transaction do
  ROR[:users].insert(
    :id         => 1,
    :name       => "Anonyme",
    :homesite   => nil,
    :jabber_id  => nil,
    :role       => "inactive",
    :created_at => "NOW()".lit,
    :updated_at => "NOW()".lit
  )

  users = TPL[:users].select(:id, :lname, :fname, :login, :email, :homesite, :jabber_id, :status, :created, :level, :passwd)
  users.where('id != 1 AND status != 0').each do |user|
    $stdout.print '.' if user[:id] % 100 == 0
    name  = [user[:lname], user[:fname]].compact
    name  = name.join(' ').strip
    name  = name.empty? ? user[:login] : name
    state = user[:status].to_i == 2 ? "deleted" : "active"
    role  = state == "active" ? "moule" : "inactive"
    role  = "reviewer"  if user[:level].to_i & (2**17) > 0
    role  = "moderator" if user[:level].to_i & (2**21) > 0
    role  = "admin"     if user[:level].to_i & (2**22) > 0
    ROR[:users].insert(
      :id           => user[:id],
      :name         => name.strip,
      :homesite     => user[:homesite],
      :jabber_id    => user[:jabber_id],
      :role         => role,
      :created_at   => user[:created],
      :updated_at   => user[:created]
    )
    ROR[:accounts].insert(
      :id           => user[:id],
      :user_id      => user[:id],
      :login        => user[:login].strip,
      :email        => user[:email].strip,
      :state        => state,
      :old_password => user[:passwd],
      :created_at   => user[:created],
      :updated_at   => user[:created]
    )
  end
end

puts "\n\n"
