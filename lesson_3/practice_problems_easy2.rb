# Q1:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
ages.include?("Spot")
ages.has_key?("Spot")
ages.member?("Spot")

# Q2:
munsters_description = "The Munsters are creepy in a good way."
puts munsters_description.swapcase!
puts munsters_description.capitalize!
puts munsters_description.downcase!
puts munsters_description.upcase!

# Q3
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }
ages.merge!(additional_ages)
p ages

# Q4
advice = "Few things in life are as important as house training your pet dinosaur."
p advice.include?("Dino")

# Q5
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones

# Q6
flintstones << "Dino"
p flintstones

# Q7
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones.push("Dino", "Hoppy")
p flintstones
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.concat(%w(Dino Hoppy))
p flintstones

# Q8
advice = "Few things in life are as important as house training your pet dinosaur."
p advice.slice!(0, advice.index("house"))
p advice

# Q9
statement = "The Flintstones Rock!"
p statement.count("t")

# Q10
title = "Flintstone Family Members"
p title.center(40)
