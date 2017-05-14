require './lib/translate'

magic = Translate.new(File.read(ARGV[0]).chomp)

magic.convert

File.open(ARGV[1], 'w+') { |file| file.write(magic.write_text_to_file) }
