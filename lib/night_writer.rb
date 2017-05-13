require './lib/braille_library'
require 'pry'

class NightWriter
  attr_reader :text_in, :braille_code

  def initialize( text_in = read_file)
    @text_in = text_in
    @braille_code = translate_to_braille_code

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
      puts braille_letter[1]
      puts braille_letter[2]
      puts braille_letter[3]
    end
  end

end

input = gets.chomp
nw = NightWriter.new(input)
