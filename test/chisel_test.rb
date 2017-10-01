require_relative 'test_helper'
require 'pry'

class ChiselTest < MiniTest::Test
  def test_chisel_exists
    assert Chisel
  end

  def test_converts_input
    chisel.input = "# My Life in Desserts\n\n## Chapter 1: The Beginning\n\nYou just *have* to try the cheesecake, he said. Ever since it appeared in\n**Food & Wine** this place has been packed every night."
    expected =
    "<h1>My Life in Desserts</h1>\n\n<h2>Chapter 1: The Beginning</h2>\n\n<p>You just <em>have</em> to try the cheesecake, he said. Ever since it appeared in <strong>Food & Wine</strong> this place has been packed every night.</p>"

    assert_equal expected, chisel.convert(chisel.input)
  end


end
