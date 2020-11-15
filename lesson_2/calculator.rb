LANGUAGE = 'en'

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def prompt(message)
  puts "=> #{message}"
end

def number?(number)
  integer?(number) || float?(number)
end
  
def float?(number)
  number.to_f.to_s == number
end
def integer?(number)
  number == '0' || number.to_i() != 0
end

def operation_to_message(operator)
  
  operator = case operator
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

prompt(messages('welcome', LANGUAGE))
name = ''

loop do
  name = gets().chomp()
  if name.empty?()
    prompt(messages('valid_name', LANGUAGE))
  else
    break
  end
end

prompt("Hi #{name}")

loop do
  num1 = ''

  loop do
    prompt(MESSAGES['first_numb'])
    num1 = Kernel.gets().chomp()

    if number?(num1)
      break
    else
      prompt(MESSAGES['valid_numb'])
    end
  end

  num2 = ''

  loop do
    prompt(MESSAGES['second_numb'])
    num2 = Kernel.gets().chomp()
    if number?(num2)
      break
    else
      prompt(MESSAGES['valid_numb'])
    end
  end


  prompt(MESSAGES['operator_prompt'])

  operator = ''
  loop do
    operator = Kernel.gets().chomp()
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(MESSAGES['valid_operation'])
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
  prompt(MESSAGES['again'])
  answer = Kernel.gets().chomp().downcase()
  break unless answer.start_with?('y')
end

prompt(MESSAGES['bye'])
