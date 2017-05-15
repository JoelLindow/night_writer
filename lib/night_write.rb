require './lib/translate'

to_braille = Translate.new(File.read(ARGV[0]).chomp)

to_braille.convert

File.open(ARGV[1], 'w+') do |file|
  file.write(to_braille.write_text_to_file)
end
