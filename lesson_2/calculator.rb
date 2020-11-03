def prompt(message)
  Kernel.puts("=> #{message}")
end

prompt("welcome to calculator!")

prompt("What's the first number?")
num1 = Kernel.gets().chomp()

prompt("What's the second number?")
num2 = Kernel.gets().chomp()

prompt("What operation would you like to perform? 1) add 2) subtract 3) multiply 4) divide")
operator = Kernel.gets().chomp()

result = case operator
        when '1'
          num1.to_i() + num2.to_i()
        when '2'
          num1.to_i() - num2.to_i()
        when '3'
          num1.to_i() * num2.to_i()
        when '4'
          num1.to_f() / num2.to_f()
end

prompt("the result is #{result}")
