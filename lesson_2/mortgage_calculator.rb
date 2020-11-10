def prompt(message)
  Kernel.puts("=> #{message}")
end

def integer?(number)
  number.to_i.to_s == number
end

def float?(number)
  number.to_f.to_s == number
end

def number?(number)
  (float?(number) || integer?(number)) && number.to_f >= 0
end
prompt("Welcome to Mortgage Calculator!")
loop do
  loan_amount = ''

  loop do
    prompt("what's the loan amount?")
    loan_amount = Kernel.gets().chomp()
    break if number?(loan_amount)
    prompt("Please enter a valid number")
  end

  loan_duration_years = ''

  loop do
    prompt("What's the loan term? (in years)")
    loan_duration_years = Kernel.gets().chomp()
    break if number?(loan_duration_years)
    prompt("Pleas enter a valid number")
  end

  annual_percentage_rate = ''

  loop do
    prompt("What's the Annual Percentage Rate?")
    annual_percentage_rate = Kernel.gets().chomp().delete("%")
    break if number?(annual_percentage_rate)
    prompt("Please enter a valid number")
  end

  loan_duration_months = loan_duration_years.to_f() * 12
  monthly_interest_rate = annual_percentage_rate.to_f() / 1200

  monthly_payment = if monthly_interest_rate == 0
                      loan_amount.to_f() / loan_duration_months
                    else
                      loan_amount.to_f() * (monthly_interest_rate /
                      (1 - (1 + monthly_interest_rate)**(-loan_duration_months)))
                    end

  results = <<-MSG

    Your monthly payment is: $#{format('%.2f', monthly_payment)}.
    a total of #{loan_duration_months} payments.
    Your monthly interest is: #{monthly_interest_rate * 100}%
  MSG

  prompt(results)
  prompt("Do you want to calculate another loan?")
  answer = gets().chomp().downcase()
  break unless answer.start_with?("y")
end

prompt("Thank you for using Mortgage Calculator. Goodbye!")
