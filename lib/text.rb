class Text
  def paragraph_tags(input)
    p_tags = input.split("\n\n").map do |line|
      "<p>#{line}</p>"
    end
    p_tags.join("\n\n")
  end

  def single_break_paragraph_tags(input)
    p_tags = input.split("\n").join
    "<p>#{p_tags}</p>"
  end

  def header2_tags(input)
    "<h2>#{input[3..-1]}</h2>"
  end

  def header3_tags(input)
    "<h3>#{input[4..-1]}</h3>"
  end

  def header4_tags(input)
    "<h4>#{input[5..-1]}</h4>"
  end

  def header5_tags(input)
    "<h5>#{input[6..-1]}</h5>"
  end

  def header6_tags(input)
    "<h6>#{input[7..-1]}</h6>"
  end

  def stronged_tags(input)
    html = input.split.map do |e|
      if e.include?("**")
        "<strong>#{e[2..-3]}</strong>"
      else
        e
      end
    end
    html.join(" ")
  end

  def emphasized_tags(input)
    html = input.split.map do |e|
      if e.start_with?("*")
        "<em>#{e[1..-1]}"
      elsif e.end_with?("*")
        "#{e[0..-2]}</em>"
      else
        e
      end
    end
    html.join(" ")
  end


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
