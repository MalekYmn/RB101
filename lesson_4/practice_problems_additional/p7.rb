statement = "The Flintstones Rock"

p statement.chars.each_with_object({}) { |i, object| object[i] = statement.count(i) unless i == " " }