##
# Interest
#
# Gotchas
#   Le calcul de l'interest ne se fait plus selon la même formule
#


puts "\n____( Interest )________________________________________________________________\n"

ROR.transaction do
  {
    'News'      => 5,
    'Diary'     => 3,
    'Post'      => 3,
    'Poll'      => 10,
    'Interview' => 10,
  }.each do |type, coeff|
    ds = ROR[:nodes].filter(:content_type => type)
    ds.update(:interest => "score * #{coeff} + UNIX_TIMESTAMP(created_at)".lit)
  end
end

