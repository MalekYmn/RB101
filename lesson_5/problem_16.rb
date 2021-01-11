=begin
A UUID is a type of identifier often used as a way to uniquely identify items...which may not all be created by the same system.
That is, without any form of synchronization, two or more separate computer systems can create new items and label them with a UUID 
with no significant chance of stepping on each other's toes.

It accomplishes this feat through massive randomization. The number of possible UUID values is approximately 3.4 X 10E38.

Each UUID consists of 32 hexadecimal characters, and is typically broken into 5 sections like this 8-4-4-4-12 and represented as a string.

It looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

Write a method that returns one UUID when called with no parameters.
=end

=begin

P:
  - input:
    - none
  - output:
    - string
      - a UUID
        - has 32 hexadecimal characters
          - hexadecimal is base-16 and includes 0-9 and a-f.
          - are they case sensitive? seems only lower cases allowed.
        - the 32 characters are broken into 5 section with "-" between them
          - the pattern is (integer is number of chars): 8-4-4-4-12
            - is that just an examole? or that pattern is necessary?
  - rules:
    - HAS TO BE RANDOM! each times it runs it generates new string.

data structures:
	- input: none
	- output: string
	- rules:
		- for hexadecimal symbols:
			- array
		- for number of chars in section:
			- array
algorithm
	- create empty string
	- for each element n in pattern array
		- add subsection(n) to the string
		- add '-' to the string unless string.length == 32
	- return string

	given a number n
	- create an empty string
	- from 1 to n
		- sample from the array and add it to the string
	- return the string
=end

def generate_UUID()
	pattern_array = [8, 4, 4, 4, 12]
	uuid = ""
	pattern_array.each do |n|
		uuid = uuid + subsection(n)
		uuid << '-' unless uuid.length >= 32
	end
	uuid
end

def subsection(n)
	section = ""
	hexadecimal_symbols = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f']
	n.times do 
		section << hexadecimal_symbols.sample
	end
	section
end

p generate_UUID
p generate_UUID
p generate_UUID