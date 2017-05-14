require './lib/braille_library'
require 'pry'

class NightWriter
  attr_reader :text_in, :braille_code, :line_one, :line_two, :line_three

  def initialize(text_in = read_file)
    @text_in = text_in
    @braille_code = translate_to_braille_code
    @line_one = ""
    @line_two = ""
    @line_three = ""
  end

  def read_file
    f = File.read(ARGV[0]).chomp
  end

  def translate_to_braille_code
    converted_to_braille_string = []
    braille_key = BrailleLibrary.new
    text_in.chars.each do |letter|
      converted_to_braille_string << braille_key.braille[letter]
    end
    converted_to_braille_string
  end

  def braile_to_three_line
    braille_code.each do |braille_letter|
      line_one << braille_letter[0]
      line_two << braille_letter[1]
      line_three << braille_letter[2]
      # binding.pry
    end
  end

  def write_text_to_file
    # File.open()
  end

end

# file = File.read(ARGV[0]).chomp
# nw = NightWriter.new(file)
# nw.braile_to_three_line
# p nw.line_one
# p nw.line_two
# p nw.line_three
