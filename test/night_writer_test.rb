require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_writer'
require 'pry'

class NightWriterTest < Minitest::Test

  def test_we_have_a_class_called_nightwrite
    write = NightWriter.new("aaaa")
    assert_instance_of NightWriter, write
  end

  def test_it_stores_the_incoming_text
    write = NightWriter.new("ban")
    assert_equal "ban", write.text_in
  end

  def test_it_can_convert_a_single_lowercase_letter_to_braille
    write = NightWriter.new("a")
    assert_equal [["0.", "..", ".."]], write.braille_code

    write_two = NightWriter.new("b")
    assert_equal [["0.", "0.", ".."]], write_two.braille_code
  end

  def test_it_can_convert_a_string_of_multiple_letters
    write = NightWriter.new("abc")
    assert_equal [["0.", "..", ".."], ["0.", "0.", ".."], ["00", "..", ".."]], write.braille_code
  end

  def test_it_can_break_braile_into_three_lines
    write = NightWriter.new("abcde")
    write.convert

    assert_equal "0.0.00000.", write.line_one
    assert_equal "..0....0.0", write.line_two
    assert_equal "..........", write.line_three
  end

  def test_it_can_use_capital_letters
    write = NightWriter.new("ABCDE")
    write.convert

    assert_equal "..0...0...00..00..0.", write.line_one
    assert_equal "......0........0...0", write.line_two
    assert_equal ".0...0...0...0...0..", write.line_three
  end

  def test_it_can_use_mixed_case_letters
    write = NightWriter.new("AbCdE")
    write.convert

    assert_equal "..0.0...0000..0.", write.line_one
    assert_equal "....0......0...0", write.line_two
    assert_equal ".0.....0.....0..", write.line_three
  end

  def test_it_can_use_punctuation_symbols
    write = NightWriter.new("!',-.?")
    write.convert

    assert_equal "............", write.line_one
    assert_equal "00..0...000.", write.line_two
    assert_equal "0..0..00.000", write.line_three
  end

  def test_it_can_mix_upcase_downcase_and_punctuation_symbols
    write = NightWriter.new("!a'B,c-D.")
    write.convert

    assert_equal "..0.....0...00....00..", write.line_one
    assert_equal "00......0.0........000", write.line_two
    assert_equal "0....0.0......00.0...0", write.line_three
  end

end
