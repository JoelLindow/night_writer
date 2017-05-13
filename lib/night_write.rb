require './braille_library'
require 'pry'

class NightWrite
  attr_reader :text_in

  def initialize(text_in = read_file)
    @text_in = text_in

  end

  def read_file
    f = File.read(ARGV[0]).chomp
  end

  def translate
    new_braille = []
    braille_key = BrailleLibrary.new
    new_braille << braille_key.braille[text_in]
  end

  def braile_map(letter)
    braille_map = {"a" => "o....."}
  end
end
