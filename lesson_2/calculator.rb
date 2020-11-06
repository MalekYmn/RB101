def prompt(message)
  puts "=> #{message}"
end

def valid_num?(number)
  number.to_i() != 0
end

def operation_to_message(operator)
  case operator
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

prompt("welcome to calculator! Enter your name:")
name = ''

loop do
  name = gets().chomp()
  if name.empty?()
    prompt('Make sure to use a valid name')
  else
    break
  end
end

prompt("Hi #{name}")

loop do
  num1 = ''

  loop do
    prompt("What's the first number?")
    num1 = Kernel.gets().chomp()

    if valid_num?(num1)
      break
    else
      prompt("Hmm... that doesn't look like a valid number")
    end
  end

  num2 = ''

  loop do
    prompt("What's the second number?")
    num2 = Kernel.gets().chomp()
    if valid_num?(num2)
      break
    else
      prompt("Hmm... that doesn't look like a valid number")
    end
  end

  operator_prompt = <<-MSG
  What operation would you like to perform? 
  1) add 
  2) subtract 
  3) multiply 
  4) divide
  MSG
  prompt(operator_prompt)

  operator = ''
  loop do
    operator = Kernel.gets().chomp()
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("choose 1, 2, 3, or 4")
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers... ")

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
  prompt("do you want to do another calculation? (Y to calculate again)")
  answer = Kernel.gets().chomp().downcase()
  break unless answer.start_with?('y')
end

prompt('Thank you for using the calculator. Bye!')
