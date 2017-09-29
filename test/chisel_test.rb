require 'minitest/autorun'
require 'minitest/pride'
require './lib/chisel'
require 'pry'

class ChiselTest < MiniTest::Test
  def test_chisel_exists
    assert Chisel
  end



end
