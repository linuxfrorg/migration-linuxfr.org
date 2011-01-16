# encoding: utf-8
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
    next if user[:login] =~ /^_+$/
    id    = user[:id]
    name  = [user[:fname], user[:lname]].compact
    name  = name.join(' ').strip
    name  = name.empty? ? user[:login] : name
    name  = name.strip.force_encoding('utf-8')
    state = user[:status].to_i == 2 ? "deleted" : "active"
    role  = state == "active" ? "moule" : "inactive"
    role  = "reviewer"  if user[:level].to_i & (2**17) > 0
    role  = "moderator" if user[:level].to_i & (2**21) > 0
    role  = "admin"     if user[:level].to_i & (2**22) > 0
    karma = TPL[:users_karma].filter(:user_id => id).get(:experience) || 20
    email = user[:email].strip.force_encoding('utf-8')
    email = "user-#{id}@dlfp.org" if email.nil? || email == ""
    ROR[:users].insert(
      :id            => id,
      :name          => name,
      :homesite      => user[:homesite].force_encoding('utf-8'),
      :jabber_id     => user[:jabber_id].force_encoding('utf-8'),
      :gravatar_hash => Digest::MD5.hexdigest(email.downcase),
      :created_at    => user[:created],
      :updated_at    => user[:created]
    )
    ROR[:accounts].insert(
      :id            => id,
      :user_id       => id,
      :login         => user[:login].strip.force_encoding('utf-8'),
      :role          => role,
      :email         => email,
      :old_password  => user[:passwd].force_encoding('utf-8'),
      :karma         => karma,
      :nb_votes      => 5,
      :confirmed_at  => (state != "deleted") ? user[:created] : nil,
      :password_salt => '$01$01$0123456789012345678901',
      :created_at    => user[:created],
      :updated_at    => user[:created]
    )
    $stdout.print '.' if id % 100 == 0
  end
end

puts "\n\n"
