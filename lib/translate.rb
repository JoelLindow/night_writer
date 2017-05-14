require './lib/braille_library'
require 'pry'

class Translate
  attr_reader :text_in, :braille_code

  def initialize(text_in = read_file)
    @text_in = text_in
    @braille_code = translate_to_braille_code
  end

  def convert
      line_one
      line_two
      line_three
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

  def line_one
    line_one = ""
    braille_code.map do |braille_letter|
      line_one << braille_letter[0]
    end
    line_one
  end

  def line_two
    line_two = ""
    braille_code.map do |braille_letter|
      line_two << braille_letter[1]
    end
    line_two
  end

  def line_three
    line_three = ""
    braille_code.map do |braille_letter|
      line_three << braille_letter[2]
    end
    line_three
  end


  def write_text_to_file
    File.open()
  end

end

# file = File.read(ARGV[0]).chomp
# nw = Translate.new(file)
# nw.convert
# p nw.line_one
# p nw.line_two
# p nw.line_three
