require 'minitest/autorun'
require 'minitest/pride'
require './lib/translate'
require 'pry'

class TranslateTest < Minitest::Test

  def test_we_have_a_class_called_nightwrite
    write = Translate.new("aaaa")
    assert_instance_of Translate, write
  end

  def test_it_stores_the_incoming_text
    write = Translate.new("ban")
    assert_equal "ban", write.text_in
  end

  def test_it_can_convert_a_single_lowercase_letter_to_braille
    write = Translate.new("a")
    assert_equal [["0.", "..", ".."]], write.braille_code

    write_two = Translate.new("b")
    assert_equal [["0.", "0.", ".."]], write_two.braille_code
  end

  def test_it_can_convert_a_string_of_multiple_letters
    write = Translate.new("abc")
    assert_equal [["0.", "..", ".."], ["0.", "0.", ".."], ["00", "..", ".."]], write.braille_code
  end

  def test_it_can_break_braile_into_three_lines
    write = Translate.new("abcde")
    write.convert

    assert_equal "0.0.00000.", write.line_one
    assert_equal "..0....0.0", write.line_two
    assert_equal "..........", write.line_three
  end

  def test_it_can_use_capital_letters
    write = Translate.new("ABCDE")
    write.convert

    assert_equal "..0...0...00..00..0.", write.line_one
    assert_equal "......0........0...0", write.line_two
    assert_equal ".0...0...0...0...0..", write.line_three
  end

  def test_it_can_use_mixed_case_letters
    write = Translate.new("AbCdE")
    write.convert

    assert_equal "..0.0...0000..0.", write.line_one
    assert_equal "....0......0...0", write.line_two
    assert_equal ".0.....0.....0..", write.line_three
  end

  def test_it_can_use_punctuation_symbols
    write = Translate.new("!',-.?")
    write.convert

    assert_equal "............", write.line_one
    assert_equal "00..0...000.", write.line_two
    assert_equal "0..0..00.000", write.line_three
  end

  def test_it_can_mix_upcase_downcase_and_punctuation_symbols
    write = Translate.new("!a'B,c-D.")
    write.convert

    assert_equal "..0.....0...00....00..", write.line_one
    assert_equal "00......0.0........000", write.line_two
    assert_equal "0....0.0......00.0...0", write.line_three
  end

end
