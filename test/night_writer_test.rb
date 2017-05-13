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

  def test_it_can_convert_a_single_lowercase_letter_to_braile
    write = NightWriter.new("a")
    assert_equal ["[0.], [..], [..]"], write.translate

    write_two = NightWriter.new("b")
    assert_equal ["[0.], [0.], [..]"], write_two.translate
  end

  def test_it_can_convert_a_string_of_multiple_letters
    skip
    write = NightWriter.new("abc")
    assert_equal ["[0.], [..], [..]", "[0.], [0.], [..]", "[00], [..], [..]"], write.translate
  end
end
