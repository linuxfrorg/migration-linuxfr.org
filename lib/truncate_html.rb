# Inspired from:
#   * http://trueparadox.net/posts/truncating_text_with_html_tags
#   * http://gist.github.com/101410
#
require "nokogiri"


def truncate_html(text, max_words=80, ellipsis="[...](suite)")
  doc = Nokogiri::HTML::DocumentFragment.parse(text)
  doc.truncate(max_words, ellipsis)
end


class Nokogiri::HTML::DocumentFragment
  def truncate(max_words, ellipsis)
    inner_truncate(max_words, ellipsis).first
  end
end

class Nokogiri::XML::Node
  def truncate(max_words, ellipsis)
    inner, remaining = inner_truncate(max_words, ellipsis)
    children.remove
    add_child Nokogiri::HTML::DocumentFragment.parse(inner)
    [to_xml, max_words - remaining]
  end

  def inner_truncate(max_words, ellipsis)
    inner, remaining = "", max_words
    self.children.each do |node|
      txt, nb = node.truncate(remaining, ellipsis)
      remaining -= nb
      inner += txt
      break if remaining < 0
    end
    [inner, remaining]
  end

  def nb_words
    inner_text.split.length
  end
end

class Nokogiri::XML::Text
  def truncate(max_words, ellipsis)
    words    = content.split
    nb_words = words.length
    return [to_xhtml, nb_words] if nb_words <= max_words
    return [ellipsis, 1] if max_words == 0
    [words.slice(0, max_words).join(' ') + ellipsis, nb_words]
  end
end
