require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_write'
require 'pry'

class NightWriteTest < Minitest::Test

  def test_we_have_a_class_called_nightwrite
    write = NightWrite.new("aaaa")
    assert_instance_of NightWrite, write
  end

  def test_it_stores_the_incoming_text
    write = NightWrite.new("banana")
    assert_equal "banana", write.text_in
  end

  def test_it_can_convert_a_single_lowercase_letter_to_braile
    write = NightWrite.new("a")
    assert_equal ["0....."], write.translate

    write_two = NightWrite.new("b")
    assert_equal ["0.0..."], write_two.translate
  end

  def test_it_can_convert_a_string_of_multiple_letters
    skip
    write = NightWrite.new("abc")
    assert_equal ["0.....", "0.0...", "00...."], write.translate
  end
end
