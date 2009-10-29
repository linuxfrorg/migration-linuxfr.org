##
# Try to convert HTML to mediawiki syntax with regexps
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

  str.strip!
  str.gsub!(/<\/?p>/, "\n")
  str.gsub!(/<a href="([^"]+)"><a href="[^"]+">(.+?)<\/a><\/a>/i) { "[#{$1} #{$2.tr('[]', '()')}]" }
  str.gsub!(/<a href="([^"]+)">(.+?)<\/a>/i) { "[#{$1} #{$2.tr('[]', '()')}]" }
  str.gsub!(/<a href="http:\/\/fr.wikipedia.org\/wiki\/([^"]+)" title="Définition Wikipédia">.+?<\/a>/, '[[\1]]')
  return str unless str =~ /<\w+>/

  str.gsub!(/<a href=["']([^']+)["']>(.+?)<\/a>/i) { "[#{$1} #{$2.tr('[]', '()')}]" }
  str.gsub!(/(`|'{2,})/, '£nowiki£\1£/nowiki£')
  str.gsub!(/<ol>.+<\/ol>/m) do |s|
    s.gsub(/\s*<ul>(.+?)<\/ul>/m) do
      $1.gsub(/\s*<li>/, "\n * ")
    end
  end
  str.gsub!(/<ul>(.+)<\/ul>/m) do
    $1.gsub(/\s*<ul>.+?<\/ul>/m) do |s|
      s.gsub(/\s*<li>/, "\n * ").strip
    end.gsub(/\s*<li>/, "\n* ")
  end
  str.gsub!(/^(\s+)([^*])/, '£spaces£\1£/spaces£\2')
  str.gsub!(/\s*<li>/i, "\n# ")
  str.gsub!(/<\/?(ol|ul|li|small|sup|a)>/i, "")
  str.gsub!(/<\/?(B|b|strong)>/, "'''")
  str.gsub!(/<\/?(I|i|em)>/, "''")
  str.gsub!(/<\/?tt>/, "`")
  str.gsub!(/<(\/?)(cite|q)>/, '<\1blockquote>')
  str.gsub!(/<(\/?)code>/, '<\1pre>')
  str.gsub!(/<(\/?)strike>/, '<\1s>')
  str.gsub!(/<hr\/?>/i, '----')
  str.gsub!(/<\/?h(\d)>/i) { '=' * $1.to_i }
  str.gsub!(/<span style="text-decoration: line-through">(.+?)<\/span>/, '<s>\1</s>')
  str.gsub!(/<span style="text-decoration: underline">(.+?)<\/span>/, '<u>\1</u>')
  str.gsub!(/<acronym +title="([^"]+)">(.+?)<\/acronym>/, '\2 (\1)')
  str.gsub!(/<acronym>(.+?)<\/acronym>/, '\1')
  str.gsub!(/<pre>(.+?)<\/pre>/m) do |s|
    s.gsub(/^£spaces£(\s+)£\/spaces£/, '\1').gsub(/£(\/?)nowiki£/, '')
  end
  str.gsub!(/^£spaces£\s+£\/spaces£/, '')
  str.gsub!(/£(\/?)nowiki£/, '<\1nowiki>')
  str.gsub!(/<br\s*\/?>/i, "\n")
  str.gsub!(/<img [^>]*?src="([^"]+)"[^>]*?>/i, '{{\1}}')

  str
end


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
  $langs[id]
end
