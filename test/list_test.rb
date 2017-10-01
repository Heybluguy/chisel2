require_relative 'test_helper'
require 'pry'

class ListTest < MiniTest::Test
  def test_it_converts_to_unordered_list
    list = List.new
    input = "* Sushi\n* Barbeque\n* Mexican"
    expected ="<ul>\n<li>Sushi</li>\n<li>Barbeque</li>\n<li>Mexican</li>\n</ul>"

    assert_equal expected, list.unordered_list(input)
  end

  def test_it_converts_to_ordered_list
    list = List.new
    input = "1. Sushi\n2. Barbeque\n3. Mexican."
    expected ="<ol>\n<li>Sushi</li>\n<li>Barbeque</li>\n<li>Mexican.</li>\n</ol>"

    assert_equal expected, list.ordered_list_item_tags(input)
  end

end
