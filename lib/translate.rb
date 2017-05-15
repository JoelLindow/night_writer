require './lib/braille_library'
require 'pry'

class Translate
  attr_reader :text_in, :braille_code
  attr_accessor :text_out

  def initialize(text_in = read_file)
    @text_in = text_in
    @braille_code = translate_to_braille_code
    @text_out = nil
  end

  def convert
      line_one; line_two; line_three; write_text_to_file
  end

  def read_file
    #this is just topass tests.
    File.read(ARGV[0]).chomp
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
    for_file = line_one + "\n" + line_two + "\n" + line_three
    # dummy_output = "DUMMY TEXT MAGIC"
    # File.open('braille.txt', 'w+') { |file| file.write(line_one + "\n") }
    # File.open('text_out', 'w+') { |file| file.write(line_one) }
  end

end

# file = File.read(ARGV[0]).chomp
# nw = Translate.new(file)
# nw.convert
# p nw.line_one
# p nw.line_two
# p nw.line_three
