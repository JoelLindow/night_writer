require './lib/translate'

magic = Translate.new(File.read(ARGV[0]).chomp)

magic.convert

output = File.open(ARGV[1], 'w+')
output.write(magic.write_text_to_file)
