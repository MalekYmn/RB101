numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  p numbers.shift(1)
end

p numbers 
=begin
what seems to be happening here is that .each method
starts with the element at index 0 (which is 1), and when shift method drops 1, the element 2 becomes at index 0
then .each method goes to the element at index 1, skipping element 2, which is then dropped at .shift.
Now element 3 is at index 0 and 4 at index 1. Since .each method already done with index 1, it stops and returns numbers which now mutated to [3, 4]
=end

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

p numbers
=begin
1
2
[1, 2]
=end
