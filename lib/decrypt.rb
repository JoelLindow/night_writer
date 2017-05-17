require './lib/braille_library'
require 'pry'
class Decrypt
attr_reader :braille_in, :line_one, :line_two, :line_three, :compiled_braille_characters

  def initialize(braille_in = file_in)
    @braille_in = braille_in
    @library = braille_decode_key
    @line_one = ""
    @line_two = ""
    @line_three = ""
    @compiled_braille_characters = []
  end

  def braille_decode_key
    key = BrailleLibrary.new
    key.braille.invert
  end

  def file_in
    File.read('./test/braille_test_string_one.txt').chomp
  end

  def make_braille_code
    break_out_3_lines
    until line_one.length == 0
    if (line_one[0..1] == "..") && (line_two[0..1] == "..") && (line_three[0..1] == ".o")
      character = []
      character << @line_one.slice!(0..3)  #<----- BROKEN!!!!!! TEST NEW FILE WITH UPPERCASE ONLY!
      character << @line_two.slice!(0..3)
      character << @line_three.slice!(0..3)
      @compiled_braille_characters << character
    else
      make_lower_case_letters
    end
    end
  end

  def make_lower_case_letters
    character = []
    character << @line_one.slice!(0..1)
    character << @line_two.slice!(0..1)
    character << @line_three.slice!(0..1)
    @compiled_braille_characters << character
  end

  def break_out_3_lines
    until braille_in.length == 0
      if braille_in.length >= 243
        break_out_eighty
      elsif braille_in.length < 243
          break_out_less_than_eighty
      end
    end
  end

  def break_out_eighty
    kill_returns = ""
    @line_one << braille_in.slice!(0..80)
      kill_returns = @line_one.slice!(-1)
    @line_two << braille_in.slice!(0..80)
      kill_returns = @line_two.slice!(-1)
    @line_three << braille_in.slice!(0..80)
      kill_returns = @line_three.slice!(-1)
  end

  def break_out_less_than_eighty
    remainder = (braille_in.length / 3)
    # kill_returns = ""
    @line_one << braille_in.slice!(0..remainder)
      # kill_returns =
      @line_one.slice!(-1)
    @line_two << braille_in.slice!(0..remainder)
      # kill_returns =
      @line_two.slice!(-1)
    @line_three << braille_in.slice!(0..remainder)
  end
end

welcome = File.read('./test/braille_test_string_two.txt').chomp
de = Decrypt.new
de.make_braille_code
binding.pry
""
