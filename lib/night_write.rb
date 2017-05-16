require './lib/translate'

file_in = ARGV[0]

input_data = File.read(file_in).chomp

to_braille = Translate.new(input_data)

file_out = ARGV[1]

output = File.open(file_out, 'w+')

output.write(to_braille.eighty_characters_wide)

message = "Created '#{ARGV[1]}' containing #{to_braille.text_in.length} characters"

puts message
