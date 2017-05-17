require 'minitest/autorun'
require 'minitest/pride'
require './lib/decrypt'

class DecryptTest < Minitest::Test

  def test_we_have_a_class_called_decrypt
    read = Decrypt.new
    assert_instance_of Decrypt, read
  end

  def test_it_can_return_single_line_of_braille
    braille_file = File.read('./test/braille_test_string_one.txt').chomp
    read = Decrypt.new(braille_file)
    read.break_out_3_lines

    assert_equal ".00.0.000.000.", read.line_one
  end

  def test_it_can_return_three_lines_of_braille
    welcome = File.read('./test/braille_test_string_one.txt').chomp
    read = Decrypt.new(welcome)
    read.break_out_3_lines

    assert_equal ".00.0.000.000.", read.line_one
    assert_equal "00.00....0...0", read.line_two
    assert_equal ".0..0...0.0...", read.line_three
  end

  def test_it_can_create_braille_keys
    welcome = File.read('./test/braille_test_string_one.txt').chomp
    read = Decrypt.new(welcome)
    read.make_braille_code

    assert_equal [
                  [".0", "00", ".0"],
                  ["0.", ".0", ".."],
                  ["0.", "0.", "0."],
                  ["00", "..", ".."],
                  ["0.", ".0", "0."],
                  ["00", "..", "0."],
                  ["0.", ".0", ".."]], read.compiled_braille_characters
  end

  def test_it_can_create_uppercase_braille_keys
    braille_file = File.read('./test/braille_test_string_three.txt').chomp
    read = Decrypt.new(braille_file)
    read.make_braille_code

    assert_equal [
                  ["..0.", "....", ".0.."],
                  ["..", "..", ".."],
                  ["0.", "..", ".."]], read.compiled_braille_characters
  end

  def test_it_convert_braille_arrays_back_to_array_of_letters
    braille_file = File.read('./test/braille_test_string_three.txt').chomp
    read = Decrypt.new(braille_file)
    read.make_braille_code

    assert_equal ["A", " ", "a"], read.braille_to_letters
  end

end
