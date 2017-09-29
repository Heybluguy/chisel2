
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
end
