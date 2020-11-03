# I typed along the video in the lesson, but this is an attempt to improve it.

Kernel.puts("What's the first number?")
num1 = Kernel.gets().chomp().to_i()

Kernel.puts("What's the second number?")
num2 = Kernel.gets().chomp().to_i()

Kernel.puts("What operation to perform (add, subtract, multiply or divide)?")
operation = Kernel.gets().chomp().downcase()

result = case operation
  when "add" then num1 + num2
  when "subtract" then num1 - num2
  when "multiply" then num1 * num2
  when "divide" then  num1.to_f / num2.to_f
  else
    "Please choose one of the given operations"
end

Kernel.puts(result)