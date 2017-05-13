braile = {
          "a" => "123456"

          }
line_one    = ""
line_two    = ""
line_three  = ""

line_one << braile["a"][0..1]
line_two << braile["a"][2..3]
line_three << braile["a"][4..5]

puts line_one
puts line_two
puts line_three
