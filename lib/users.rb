##
# Users -> Users & Accounts
#
# Gotchas
#   le user 1 est anonyme, avec des données qui explosent sequel
#   le status à 0 correspond à des utilisateurs pas encore validés
#

puts "\n____( Users )___________________________________________________________________\n"

ROR.transaction do
  users = TPL[:users].select(:id, :lname, :fname, :login, :email, :homesite, :jabber_id, :status, :created, :level, :passwd)
  users.where('id != 1 AND status != 0').each do |user|
    id    = user[:id]
    name  = [user[:fname], user[:lname]].compact
    name  = name.join(' ').strip
    name  = name.empty? ? user[:login] : name
    state = user[:status].to_i == 2 ? "deleted" : "active"
    role  = state == "active" ? "moule" : "inactive"
    role  = "reviewer"  if user[:level].to_i & (2**17) > 0
    role  = "moderator" if user[:level].to_i & (2**21) > 0
    role  = "admin"     if user[:level].to_i & (2**22) > 0
    karma = TPL[:users_karma].filter(:user_id => id).get(:experience) || 20
    email = user[:email].strip
    email = "user-#{id}@dlfp.org" if email.nil? || email == ""
    $stdout.print '.' if id % 100 == 0
    ROR[:users].insert(
      :id           => id,
      :name         => name.strip,
      :homesite     => user[:homesite],
      :jabber_id    => user[:jabber_id],
      :role         => role,
      :created_at   => user[:created],
      :updated_at   => user[:created]
    ) if state != "deleted"
    ROR[:accounts].insert(
      :id           => id,
      :user_id      => id,
      :login        => user[:login].strip,
      :email        => email,
      :old_password => user[:passwd],
      :karma        => karma,
      :nb_votes     => 5,
      :confirmed_at => (state != "deleted") ? user[:created] : nil
      :created_at   => user[:created],
      :updated_at   => user[:created]
    )
  end
end

puts "\n\n"
