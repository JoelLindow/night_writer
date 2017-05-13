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

  def test_it_can_convert_string_to_braile
    write = NightWrite.new("aaa")
    assert_equal ["o.....","o.....","o....."], write.translate
  end
end
