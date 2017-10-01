require_relative 'test_helper'
require 'pry'

class ListTest < MiniTest::Test
  def test_it_converts_to_unordered_list
    list = List.new
    input = "<li>Sushi</li>\n<li>Barbeque</li>\n<li>Mexican</li>"
    expected ="<ul>\n<li>Sushi</li>\n<li>Barbeque</li>\n<li>Mexican</li>\n</ul>"

    assert_equal expected, list.unordered_list(input)

    input = "My favorite cuisines are:\n\n<li>Sushi</li>\n<li>Barbeque</li>\n<li>Mexican</li>"
    expected ="<p>\nMy favorite cuisines are:\n</p>\n\n<ul>\n<li>Sushi</li>\n<li>Barbeque</li>\n<li>Mexican</li>\n</ul>"

     assert_equal expected, list.unordered_list(input)
  end

  def test_it_converts_to_ordered_list
    list = List.new
    input = "1. Sushi\n2. Barbeque\n3. Mexican."
    expected ="<ol>\n<li>Sushi</li>\n<li>Barbeque</li>\n<li>Mexican.</li>\n</ol>"

    assert_equal expected, list.ordered_list_item_tags(input)

    input = "My favorite cuisines are:\n\n1. Sushi\n2. Barbeque\n3. Mexican"
    expected ="<p>\nMy favorite cuisines are:\n</p>\n\n<ol>\n<li>Sushi</li>\n<li>Barbeque</li>\n<li>Mexican</li>\n</ol>"

    assert_equal expected, list.ordered_list_item_tags(input)
  end

end
