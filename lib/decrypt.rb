require './lib/braille_library'

class Decrypt
attr_reader :braille_in,
            :line_one,
            :line_two,
            :line_three,
            :compiled_braille_characters

  def initialize(braille_in)
    @braille_in = braille_in
    @line_one   = ""
    @line_two   = ""
    @line_three = ""
    @compiled_braille_characters = []
  end

  def letter_collection_to_text
    braille_to_letters.join
  end

  def braille_to_letters
    compiled_braille_characters.map do |character|
      braille_decode_key[character]
    end
  end

  def braille_decode_key
    key = BrailleLibrary.new
    key.braille.invert
  end

  def make_braille_code
    break_out_3_lines
    until line_one.length == 0
      if condition_for_four_line
        make_upper_case_letters
      else
        make_lower_case_letters
      end
    end
  end

  def condition_for_four_line
    line_one[0..1]   == ".." &&
    line_two[0..1]   == ".." &&
    line_three[0..1] == ".0" ||
    line_one[0..1]   == ".0" &&
    line_two[0..1]   == ".0" &&
    line_three[0..1] == "00"
  end

  def make_lower_case_letters
    character = []
    character << @line_one.slice!(0..1)
    character << @line_two.slice!(0..1)
    character << @line_three.slice!(0..1)
    @compiled_braille_characters << character
  end

  def make_upper_case_letters
    character = []
    character << @line_one.slice!(0..3)
    character << @line_two.slice!(0..3)
    character << @line_three.slice!(0..3)
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
    remainder = ((braille_in.length - 1) / 3)
    @line_one << braille_in.slice!(0..remainder)
    kill_returns = @line_one.slice!(-1)
    @line_two << braille_in.slice!(0..remainder)
    kill_returns = @line_two.slice!(-1)
    @line_three << braille_in.slice!(0..remainder)
  end
end
