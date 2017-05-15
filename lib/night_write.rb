require './lib/translate'

file_in = ARGV[0]

input_data = File.read(file_in).chomp

to_braille = Translate.new(input_data)

to_braille.convert

file_out = ARGV[1]

output = File.open(file_out, 'w+')
output.write(to_braille.write_text_to_file)
