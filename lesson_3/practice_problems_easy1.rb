# Question 1:
numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers # I expect it will output 1 2 2 3 vertically. if the method was uniq! instead it would have mutated the array to [1, 2, 3]


=begin Question 2:
! is "not" (or indicates a mutating method) whereas ? usually returns boolean. In otherwords, ! changes boolean but ? returns it. (usually)

1- != means doesn not equal and it's used in conditional statements and loops
2- Turns it into the opposite of the object's boolean value
3- indicates a mutating method. It mutates the caller. but not necessarily. Just a convention.
4- I don't know... looks up the definition of something on pry. and turns number into string.
5- indicates that it returns a boolean. Again just a convention.
6- returns the boolean value of the object
=end

# Question 3:
advice = "Few things in life are as important as house training your pet dinosaur."
advice.sub!("important", "urgent") 
puts advice

# Question 4:
numbers = [1, 2, 3, 4, 5]
numbers.delete_at(1) #deletes the element at index 1
p numbers
numbers = [1, 2, 3, 4, 5]
numbers.delete(1) # deletes the element 1
p numbers

# Question 5:
p (10..100).include?(42)

# Question 6
famous_words = "seven years ago..."
puts famous_words.prepend("Four score and ")
famous_words = "seven years ago..."
famous_words.insert(0, "Four score and ")
puts famous_words

# Question 7:
flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

flintstones.flatten!
p flintstones

# Question 8:
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
flintstones = flintstones.rassoc(2)
p flintstones