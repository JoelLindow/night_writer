# Night-Writer

A Turing School project to convert or decode.

### Part 1: night_write.rb

This portion of the program is used from the command line like so:
```
$ ruby ./lib/night_write.rb message.txt braille.txt
Created 'braille.txt' containing 256 characters
```
That will use the plaintext file message.txt to create a Braille simulation file braille.txt.


### Part 2: night_read.rb

This portion of the program can convert that Braille simulation back to normal text:
```
$ ruby ./lib/night_read.rb braille.txt original_message.txt
Created 'original_message.txt' containing 256 characters.
```

### Characters Supported

Characters supported in this program are compliant to required project spec:
```
" !',-.?abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
```

Project spec states that the first character is a "space" and that the quotation marks are actually not to be supported.


### Special Notation in Braille

2 special pieces of notation that should be noticed in the Braille code are:

* Uppercase Indicator (suggests that following braille character is a capital letter)
```
..
..
.0
```

* Numeral Indicator (suggests that following braille character is a number)
```
.0
.0
00
```

## THANKS FOR CHECKING OUT OR PROJECT! CLONE DOWN AND ENJOY!
Please execute all code from the project root directory.
