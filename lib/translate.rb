require './lib/braille_library'
require 'pry'

class Translate
  attr_reader :text_in, :braille_code
  attr_accessor :text_out

  def initialize(text_in)
    @text_in = text_in
    @braille_code = translate_to_braille_code
    @text_out = []
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
    braille_code.reduce("") do |result, braille_letter|
        result << braille_letter[0]
    end
  end

  def line_two
    braille_code.reduce("") do |result, braille_letter|
        result << braille_letter[1]
    end
  end

  def line_three
    braille_code.reduce("") do |result, braille_letter|
        result << braille_letter[2]
    end
  end

  def eighty_characters_wide
    one = line_one
    two = line_two
    three = line_three
    until one.length == 0
      @text_out << one.slice!(0..79) + "\n"
      @text_out << two.slice!(0..79) + "\n"
      @text_out << three.slice!(0..79) + "\n"
    end
    @text_out.join
  end


end

stuff = Translate.new("1234567890ABCDEFGHIJ")
binding.pry
""
