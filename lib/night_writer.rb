require './lib/braille_library'
require 'pry'

class NightWriter
  attr_reader :text_in

  def initialize(text_in = read_file)
    @text_in = text_in
    @braile_code = translate_to_braile_code
    # binding.pry
  end

  def read_file
    f = File.read(ARGV[0]).chomp
  end

  def translate_to_braile_code
    new_braille = []
    braille_key = BrailleLibrary.new
    new_braille << braille_key.braille[text_in]
    new_braille
  end

  def braile_to_three_line
    
  end

end
