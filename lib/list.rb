class List
  def list_item_tags(input)
    html = input.split("\n").map do |e|
      if e.include?("* ")
        "<ul>\n<li>#{e[2..-1]}</li>\n</ul>"
      elsif ("1".."10").include?(e[0])
        "<ul>\n<li>#{e[3..-1]}</li>\n</ul>"
      else
        e
      end
    end
    html.join("\n")
  end

  def ordered_list_item_tags(input)
    html = input.split("\n").map do |e|
      if ("0".."10").include?(e[0])
        "<li>#{e[3..-1]}</li>"
      else
        e
      end
    end.join("\n")
    html = html.split("\n\n").map do |e|
      if e.include?("<li>")
        "<ol>\n#{e}\n</ol>"
      else
        "<p>\n#{e}\n</p>"
      end
    end
    html.join("\n\n")
  end

  def unordered_list(input)
    html = input.split("\n\n").map do |e|
      if e.include?("<li>")
        "<ul>\n#{e}\n</ul>"
      else
        "<p>\n#{e}\n</p>"
      end
    end
    html.join("\n\n")
  end

end
