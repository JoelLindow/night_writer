class BrailleLibrary
  attr_reader :braille

  def initialize
    @braille = {
                "a" => "[0.], [..], [..]",
                "b" => "[0.], [0.], [..]",
                "c" => "[00], [..], [..]",
                "d" => "[00], [.0], [..]",
                "e" => "[0.], [.0], [..]",
                "f" => "[00], [0.], [..]",
                "g" => "[0.], [00], [..]",
                "h" => "[0.], [00], [..]",
                "i" => "[.0], [0.], [..]",
                "j" => "[.0], [00], [..]",
                "k" => "[0.], [..], [0.]",
                "l" => "[0.], [0.], [0.]",
                "m" => "00..0.",
                "n" => "00.00.",
                "o" => "0..00.",
                "p" => "000.0.",
                "q" => "00000.",
                "r" => "0.000.",
                "s" => ".00.0.",
                "t" => ".0000.",
                "u" => "0...00",
                "v" => "0.0.00",
                "w" => ".000.0",
                "x" => "00..00",
                "y" => "00.000",
                "z" => "0..000",
                "#" => ".0.000",
                "0" => ".000..",
                "1" => "0.....",
                "2" => "0.0...",
                "3" => "00....",
                "4" => "00.0..",
                "5" => "0..0..",
                "6" => "000...",
                "7" => "0000..",
                "8" => "0.00..",
                "9" => ".00...",
                " " => "      ",
                "!" => "..000.",
                "'" => ".....0",
                "," => "..0...",
                "-" => "....00",
                "." => "..00.0",
                "?" => "..0.00",
                :cap => ".....0",
              }
  end


end
