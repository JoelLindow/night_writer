require './lib/translate'

to_braille = Translate.new(File.read(ARGV[0]).chomp)

to_braille.convert

output = File.open(ARGV[1], 'w+')
output.write(to_braille.write_text_to_file)
