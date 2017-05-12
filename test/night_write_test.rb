require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_write'

class NightWriteTest < Minitest::Test


  def test_do_we_have_a_class_called_nightwrite
    write = NightWrite.new
    assert_instance_of NightWrite, write
  end

end
