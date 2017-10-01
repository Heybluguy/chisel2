require_relative 'text'
require_relative 'list'
require 'pry'

class Chisel
  attr_accessor :input, :output

  def initialize
    @input = File.read(ARGV[0])
    @output = File.open(ARGV[1], "w")
    @text = Text.new
  end

def convert(input)
  paragraph_tags(input)


end
end


# chisel = Chisel.new
# chisel.paragraph_tags(chisel.input)
# binding.pry
# my_output.write(my_input.upcase)
