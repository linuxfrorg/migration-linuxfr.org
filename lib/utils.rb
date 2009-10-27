$w_total = 0
$w_html2 = 0

##
# Try to convert HTML to mediawiki syntax
#
# First, we try a simple convertion in Ruby.
# If there is no more HTML tags, we use it.
# Else, the html2wikipedia binary is used.
#
def wikify(html)
  return "" if html.nil?
  $w_total += 1
  html.strip!

  # Ruby
  str = html.dup
  str.gsub!(/<a href="([^"]+)">([^<]+)<\/a>/, '[\1 \2]')
  str.gsub!(/<a href="http:\/\/fr.wikipedia.org\/wiki\/([^"]+)" title="Définition Wikipédia">[^<]+<\/a>/, '[[\1]]')
  return str unless str =~ /<\w+>/

  # html2wikipedia
  $w_html2 +=1
  html.gsub!(/<span style="text-decoration: line-through">([^<]+)<\/span>/, '<s>\1</s>')
  html.gsub!(/<span style="text-decoration: underline">([^<]+)<\/span>/, '<u>\1</u>')
  IO.popen("html2wikipedia", "w+") do |h2w|
    h2w << "<html><body>" << html << "</body></html>"
    h2w.close_write
    str = h2w.read(nil).strip!
  end
  str
end


def puts_wikify_stats
  puts "Ruby  : #{$w_total - $w_html2}"
  puts "html2 : #{$w_html2}"
  puts "Total : #{$w_total}"
end
