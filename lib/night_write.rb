require './lib/translate'

file = File.read(ARGV[0]).chomp
magic = Translate.new(file)
magic.convert
