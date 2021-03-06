# encoding: utf-8
##
# Try to convert HTML to LinuxFr Flavord Markdown with regexps
#
# Gotchas
#   Les crochets dans les liens cassent la syntaxe wiki (cf la veille April)
#   Certains tags HTML ne peuvent pas être générés depuis la syntaxe wiki
#   Les listes imbriquées avec mélange de <ul> et de <ol>
#   Un paquet de liens imbriqués dans des liens (<a href=""><a href="">...</a></a>)
#   Attention à l'ordre des regexps !
#   Ça ne marche pas terrible pour les images
#
def wikify(str)
  return "" if str.nil?

  str = str.force_encoding('utf-8').encode
  str = str.strip
  begin
    str.gsub!(/<\/?p>/i, "\n")
  rescue ArgumentError
    str = str.force_encoding("iso-8859-15").encode("utf-8")
    retry
  end
  str.gsub!(/<a href="([^"]+)"><a href="[^"]+">(.+?)<\/a><\/a>/i) { "[#{$2.tr('[]', '()')}](#{$1})" }
  str.gsub!(/<a href="([^"]+)"><img src="([^"]+)" alt="([^"]+)"[^>]*><\/a>/i, '[![\3](\2)](\1)')
  str.gsub!(/<a href="([^"]+)"><img src="([^"]+)"[^>]*><\/a>/i, '[![](\2)](\1)')
  str.gsub!(/<a href="([^"]+)">(.+?)<\/a>/i) { "[#{$2.tr('[]', '()')}](#{$1})" }
  str.gsub!(/<a href="http:\/\/fr.wikipedia.org\/wiki\/([^"]+)" title="Définition Wikipédia">.+?<\/a>/, '[[\1]]')
  return str unless str =~ /<[^>]+>/

  str.gsub!(/<a href=["']([^']+)["']>(.+?)<\/a>/i) { "[#{$2.tr('[]', '()')}](#{$1})" }
  str.gsub!(/(`|_|\\|\[|\]|\.|#)/, '\\1')
  str.gsub!(/<ol>.+<\/ol>/im) do |s|
    "\n\n" + s.gsub(/\s*<ul>(.+?)<\/ul>/im) do
      $1.gsub(/\s*<li>/i, "\n * ")
    end
  end
  str.gsub!(/<ul>(.+)<\/ul>/im) do
    "\n\n" + $1.gsub(/\s*<ul>.+?<\/ul>/im) do |s|
      s.gsub(/\s*<li>/i, "\n * ").strip
    end.gsub(/\s*<li>/i, "\n* ")
  end
  str.gsub!(/\s*<li>/i, "\n1. ")
  str.gsub!(/^([ \t]+)/, '£spaces£\1£/spaces£')
  str.gsub!(/<\/?(ol|ul|li|small|sup|a)>/i, "")
  str.gsub!(/<\/?(b|strong)>/i, "**")
  str.gsub!(/<\/?(i|em)>/i, "_")
  str.gsub!(/<\/?tt>/i, "`")
  str.gsub!(/<(\/?)(cite|q)>/i, "\n> \\1")
  str.gsub!(/<(\/?)code>/i, '<\1pre>')
  str.gsub!(/<hr\/?>/i, '----')
  str.gsub!(/<h(\d)>/i)   { '#' * $1.to_i + ' ' }
  str.gsub!(/<\/h(\d)>/i) { ' ' + '#' * $1.to_i }
  str.gsub!(/<acronym +title="Note des modérateurs">NdM<\/acronym>/i, "\nNdM")
  str.gsub!(/<acronym +title="([^"]+)">(.+?)<\/acronym>/i, '\2 (\1)')
  str.gsub!(/<acronym>(.+?)<\/acronym>/i, '\1')
  str.gsub!(/<pre>(.+?)<\/pre>/im) do |s|
    s.gsub(/<\/?pre>/, '').
      gsub(/^/, '    ').
      gsub(/^£spaces£(\s+)£\/spaces£/, '\1')
  end
  str.gsub!(/^£spaces£\s+£\/spaces£/, '')
  str.gsub!(/<br\s*\/?>\n?/i, "  \n")
  str.gsub!(/  \n\n/, "\n\n")
  str.gsub!(/<img [^>]*?alt="([^"]+)" src="([^"]+)"[^>]*?>/i, '![\1](\2)')
  str.gsub!(/<img [^>]*?src="([^"]+)" alt="([^"]+)"[^>]*?>/i, '![\2](\1)')
  str.gsub!(/<img [^>]*?src="([^"]+)"[^>]*?>/i, '![](\1)')
  str.gsub!(/<a name=[^>]*>/i, '')
  str.gsub!(/<a href=[^>]*>/i, '')

  str
end


##
# Rajoute des <br/> en fin de ligne comme le nl2br de templeet
#
#   nl2br("foo\nbar")   # => "foo<br/>\nbar"
#
def nl2br(txt)
  return '' if txt.nil?
  txt = txt.force_encoding('utf-8')
  begin
    tmp = txt.gsub(/(<\/?)acronym/, '\1abbr')
    return tmp if tmp =~ /<br\s*\/>/
    tmp.gsub(/\n/, "<br/>\n")
  rescue ArgumentError
    txt = txt.force_encoding("iso-8859-15").encode("utf-8")
    retry
  end
end


##
# Supprime toutes les balises et entités HTML
#
#    no_tags("Le <b>gras</b>, c'est la vie")   # => "Le gras c'est la vie"
#
def no_tags(txt)
  return '' if txt.nil?
  txt = txt.force_encoding('utf-8')
  begin
    Decoder.decode(txt.strip.gsub(/<[^>]*>/, ''))
  rescue ArgumentError
    txt = txt.force_encoding("iso-8859-15").encode("utf-8")
    retry
  end
end
Decoder = HTMLEntities.new


##
# Renvoie le code à 2 lettres d'une lang identifiée par son id
#
#   lang(1)   # => 'fr'
#
def lang(id)
  $langs ||= TPL[:lang].all.inject({}) do |h,l|
    h[l[:id]] = l[:lang]
    h
  end
  $langs[id] || 'xx'
end
