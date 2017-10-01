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

  def convert
    conversion = @text.stronged_tags(@input)
    conversion = @text.emphasized_tags(conversion)
    conversion = @text.header6_tags(conversion)
    conversion = @text.header5_tags(conversion)
    conversion = @text.header4_tags(conversion)
    conversion = @text.header3_tags(conversion)
    conversion = @text.header2_tags(conversion)
    conversion = @text.header1_tags(conversion)
    conversion = @text.paragraph_tags(conversion)
    conversion.gsub!("&", "&amp;")
  end

  def write_output
    output.write(convert)
  end
end


chisel = Chisel.new
# binding.pry
chisel.write_output
