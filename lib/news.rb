##
# News & News_attachements & News_author & News_moderated -> News & Nodes
#
# Gotchas
#   Les jointures sur les tables (surtout les LEFT JOINs)
#   Certains attachements sont au format binaire
#   7 dépêches ont 2 attachements
#   34 dépêches ont le state 4 - à purger
#   On peut avoir 0, 1 ou plusieurs utilisateurs qui ont modéré une dépêche
#


puts "\n____( News )____________________________________________________________________\n"

ROR.transaction do
  sql = <<-EOS
   SELECT n.id, n.topic_id, n.state, n.timestamp, n.title, n.body, n.user_id,
          i.score, i.interest,
          a.name AS author_name, a.contact AS author_contact,
          pj.attachement AS second_part
     FROM news              AS n
LEFT JOIN interest          AS i  ON n.id = i.res_id AND res_type = 1
LEFT JOIN news_author       AS a  ON a.id = n.author_id
LEFT JOIN news_attachements AS pj ON n.id = pj.news_id AND pj.id NOT IN (6, 8, 46, 159, 195, 197, 206)
    WHERE n.state != 4
      AND (
               pj.content_type IS NULL
            OR pj.content_type = ''
            OR pj.content_type = 'text/plain'
            OR pj.content_type = 'text/html'
          )
  EOS
  TPL.fetch(sql) do |news|
    $stdout.print '.' if news[:id] % 100 == 0
    published = news[:state].to_i == 1
    moderator_id = TPL[:news_moderated].filter(:news_id => news[:id]).get(:user_id)
    ROR[:news].insert(
      :id           => news[:id],
      :state        => (published ? 'published' : 'refused'),
      :title        => news[:title].strip,
      :body         => wikify(news[:body]),
      :second_part  => wikify(news[:second_part]),
      :moderator_id => moderator_id,
      :section_id   => news[:topic_id] || 'Pas de titre',
      :author_name  => news[:author_name],
      :author_email => news[:author_contact],
      :created_at   => news[:timestamp],
      :updated_at   => news[:timestamp]
    )
    ROR[:nodes].insert(
      :content_id   => news[:id],
      :content_type => 'News',
      :score        => news[:score] || 0,
      :interest     => news[:interest] || 'NOW()'.lit,
      :user_id      => news[:user_id],
      :public       => (published ? 0 : 1),
      :created_at   => news[:timestamp],
      :updated_at   => news[:timestamp]
    )
  end
end

puts "\n\n"