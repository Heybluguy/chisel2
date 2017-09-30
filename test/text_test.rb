require 'minitest/autorun'
require 'minitest/pride'
require './lib/text'
require 'pry'

class TestTest < MiniTest::Test
  def test_it_converts_to_paragraph
    text = Text.new
    input = "This is the first line of the paragraph."
    expected = "<p>This is the first line of the paragraph.</p>"

    assert_equal expected, text.paragraph_tags(input)
  end

  def test_it_converts_to_paragraph_with_single_break
    text = Text.new
    input =
    "This is the first line of the paragraph.\n This is the second line of the same paragraph."
    expected = "<p>This is the first line of the paragraph. This is the second line of the same paragraph.</p>"

    assert_equal expected, text.single_break_paragraph_tags(input)
  end

  def test_it_converts_to_multiple_paragraphs
    text = Text.new
    input = "This is the first line of the paragraph."
    expected = "<p>This is the first line of the paragraph.</p>"

    assert_equal expected, text.paragraph_tags(input)
  end

  def test_it_converts_to_header2
    text = Text.new
    input = "## Here's an H2"
    expected = "<h2>Here's an H2</h2>"

    assert_equal expected, text.header2_tags(input)
  end

  def test_it_converts_to_header3
    text = Text.new
    input = "### Here's an H3"
    expected = "<h3>Here's an H3</h3>"

    assert_equal expected, text.header3_tags(input)
  end

  def test_it_converts_to_header4
    text = Text.new
    input = "#### Here's an H4"
    expected = "<h4>Here's an H4</h4>"

    assert_equal expected, text.header4_tags(input)
  end

  def test_it_converts_to_header5
    text = Text.new
    input = "##### Here's an H5"
    expected = "<h5>Here's an H5</h5>"

    assert_equal expected, text.header5_tags(input)
  end

  def test_it_converts_to_header6
    text = Text.new
    input = "###### Here's an H6"
    expected = "<h6>Here's an H6</h6>"

    assert_equal expected, text.header6_tags(input)
  end



  def test_it_converts_to_stronged
    text = Text.new
    input = "My emphasized and **stronged** text is awesome."
    expected = "My emphasized and <strong>stronged</strong> text is awesome."

    assert_equal expected, text.stronged_tags(input)
  end

  def test_it_converts_to_emphasized
    text = Text.new
    input = "My *emphasized and stronged text* is awesome."
    expected = "My <em>emphasized and stronged text</em> is awesome."

    assert_equal expected, text.emphasized_tags(input)
  end

  def test_it_converts_to_emphasized_and_stronged
    text = Text.new
    input = "My *emphasized and **stronged** text* is awesome."
    expected = "My *emphasized and <strong>stronged</strong> text* is awesome."

    assert_equal expected, text.stronged_tags(input)

    expected = "My <em>emphasized and <strong>stronged</strong> text</em> is awesome."

    assert_equal expected, text.emphasized_tags(text.stronged_tags(input))
  end

  def test_it_converts_to_list_items
    text = Text.new
    input = "* Sushi\n* Barbeque\n* Mexican.\n"
    expected ="<li>Sushi</li>\n<li>Barbeque</li>\n<li>Mexican.</li>"

    assert_equal expected, text.list_item_tags(input)

    input = "1. Sushi\n2. Barbeque\n3. Mexican.\n"
    expected ="<li>Sushi</li>\n<li>Barbeque</li>\n<li>Mexican.</li>"

     assert_equal expected, text.list_item_tags(input)

  end


  def test_it_converts_to_unordered_list_items
    text = Text.new
    input = "<li>Sushi</li>\n<li>Barbeque</li>\n<li>Mexican.</li>"
    expected ="<ul>\n<li>Sushi</li>\n<li>Barbeque</li>\n<li>Mexican.</li>\n</ul>"

    assert_equal expected, text.unordered_list_tags(input)

    input = "My favorite cuisines are:\n\n<li>Sushi</li>\n<li>Barbeque</li>\n<li>Mexican.</li>"
    expected ="<p>\nMy favorite cuisines are:\n</p>\n\n<ul>\n<li>Sushi</li>\n<li>Barbeque</li>\n<li>Mexican.</li>\n</ul>"

     assert_equal expected, text.unordered_list_tags(input)
  end




  # def test_it_converts_to_ordered_list_items
  #   text = Text.new
  #   input = "<li>Sushi</li>\n<li>Barbeque</li>\n<li>Mexican.</li>"
  #   expected ="<ol>\n<li>Sushi</li>\n<li>Barbeque</li>\n<li>Mexican.</li>\n</ol>"
  #
  #   assert_equal expected, text.unordered_list_tags(input)
  #
  #   # input = "My favorite cuisines are:\n\n<li>Sushi</li>\n<li>Barbeque</li>\n<li>Mexican.</li>"
  #   # expected ="<p>\nMy favorite cuisines are:\n</p>\n\n<ul>\n<li>Sushi</li>\n<li>Barbeque</li>\n<li>Mexican.</li>\n</ul>"
  #   #
  #   #  assert_equal expected, text.ordered_list_tags(input)
  # end



end
