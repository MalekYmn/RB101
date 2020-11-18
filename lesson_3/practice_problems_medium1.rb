# Q1:
10.times { |n| puts (" " * n) + "The Flintstones Rock!" }
10.times { |n| puts "The Flintstones Rock!".rjust("The Flintstones Rock!".length + n) }

# Q2:
=begin
# The error is "`+': no implicit conversion of Integer into String (TypeError)"
which means that the integer will not be turned into a string implicity.
The way to fix it is to do it explicitly.
=end
puts "the value of 40 + 2 is " + (40 + 2).to_s
puts "the value of 40 + 2 is #{40 + 2}"

# Q3
def factors(number)
  divisor = number
  factors = []
  until divisor == 0
    break if number <= 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end
p factors(8)
p factors(-2)
# bonus 1: so we only get factors of number. bonus 2: So it returns factors as a method returns the last line unless there's an explicit return statement before.
def factors(number)
  divisor = number
  factors = []
  while divisor > 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end
p factors(8)
p factors(-2)

# Q4
# Yes, the first method will mutate the original array but the secone method will not.

# Q5
#The problem is that limit isn't defined within the method's scope. Here'sone way to fix it:
def fib(first_num, second_num, limit)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, 15)
puts "result is #{result}"

# Q6
# 34

# Q7
# Yes, because the .each method doesn't mutate the caller the methods called within the block DO.

# Q8
# It'll display "paper"

# Q9:
# It'll return "no"