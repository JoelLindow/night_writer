require './lib/decrypt'

file_in = ARGV[0]

input_data = File.read(file_in) #.chomp

to_characters = Decrypt.new(input_data)

to_characters.make_braille_code

file_out = ARGV[1]

output = File.open(file_out, 'w+')

output.write(to_characters.letter_collection_to_text)

character_count = to_characters.letter_collection_to_text.length

message = "Created '#{ARGV[1]}' containing #{character_count} characters"

puts message
