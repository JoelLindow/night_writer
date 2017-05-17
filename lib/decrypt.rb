require './lib/braille_library'
require 'pry'
class Decrypt
attr_reader :braille_in, :line_one, :line_two, :line_three

  def initialize(braille_in = file_in)
    @braille_in = braille_in
    @library = braille_decode_key
    @line_one = ""
    @line_two = ""
    @line_three = ""
  end

  def braille_decode_key
    key = BrailleLibrary.new
    key.braille.invert
  end

  def file_in
    File.read('./test/braille_test_string_two.txt').chomp
  end

  def make_braille_code
    break_out_3_lines
    character = []
  end


  def break_out_3_lines
    until braille_in.length == 0
      if braille_in.length >= 243
        kill_returns = ""
        @line_one << braille_in.slice!(0..80)
          kill_returns = @line_one.slice!(-1)
        @line_two << braille_in.slice!(0..80)
          kill_returns = @line_two.slice!(-1)
        @line_three << braille_in.slice!(0..80)
          kill_returns = @line_three.slice!(-1)
      elsif braille_in.length < 243
        remainder = (braille_in.length / 3)
        kill_returns = ""
        @line_one << braille_in.slice!(0..remainder)
          kill_returns = @line_one.slice!(-1)
        @line_two << braille_in.slice!(0..remainder)
          kill_returns = @line_two.slice!(-1)
        @line_three << braille_in.slice!(0..remainder)
          # kill_returns = @line_three.slice!(-1)
      end
    end
  end

end
#
# de = Decrypt.new
# de.break_out_3_lines
# binding.pry
# ""
