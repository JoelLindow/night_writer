require 'pry'

class NightWrite
  attr_reader :text_in
  braille_map = {"a" => "o....."}

  def initialize(text_in = read_file)
    @text_in = text_in

  end

  def read_file
    f = File.read(ARGV[0]).chomp
  end

  def translate
    ["o.....","o.....","o....."]
  end
end



#
# binding.pry
# ""
