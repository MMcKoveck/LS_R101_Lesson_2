=begin
Take everything you've' learned so far and build a mortgage calculator (or car payment calculator 
-- it's' the same thing).

You'll' need three pieces of information:

the loan amount
the Annual Percentage Rate (APR)
the loan duration
From the above, you'll' need to calculate the following things:

monthly interest rate
loan duration in months
monthly payment
You can use the following formula:

Mortgage Calculator Formula IMAGE

Translated to Ruby, this is what the formula looks like:

m = p * (j / (1 - (1 + j)**(-n)))

m = monthly payment
p = loan amount
j = monthly interest rate
n = loan duration in months
When you write your program, don't' use the single-letter variables m, p, j, and n; 
use explicit names. For instance, you may want to use loan_amount instead of p.

Finally, don't' forget to run your code through Rubocop.

Hints:

Figure out what format your inputs need to be in. 
For example, should the interest rate be expressed as 5 or .05, if you mean 5% interest?
If you're' working with Annual Percentage Rate (APR), 
you'll' need to convert that to a monthly interest rate.
Be careful about the loan duration -- are you working with months or years? (MONTHS)
Choose variable names carefully to assist in remembering.
You can use this loan calculator to check your results.
https://www.calculator.net/loan-calculator.html
=end # ASSIGNMENT
=begin PEDAC
greeting
need 3 variables so 3 questions
  Use a prompt?
validate the inputs
convert the inputs to appropriate metrics
from those 3 inputs calculate 3 outputs
refactor the formula
express those outputs conversationally
ask to redo or quit

So inputs 3 questions validated strings
  variables should be integers/floats
    no need for hashes or arrays?
  loan amount
  APR (year to months)
  duration (years to months)
output 3 outputs interpolated conversationally
  monthly interest rate
  loan duration (in months)
  monthly payment (dollars and cents)

Welcome to the loan calculator. 
please enter the loan amount.
  please enter an integer only
please enter the APR
  please enter an integer with a decimal.
please enter the length of the loan in months
  please enter an integer.
  
(please prompt?)
if you have a loan for (amount) at (APR) for (duration),
  your monthly interest rate will be (rate)
  It will take you (months) to finish
  and your monthly payment will be (payment)  

would you like to calculate another loan?
  yes - again from after the welcome
  no - thank you gor using the loan calculator, goodbye!

# INTEGER VALIDATOR
def integer?(input)
  /^-?\d+$/.match(input)
end  
# FLOAT VALIDATOR
def float?(input)
  /\d/.match(input) && /^-?\d*\.?\d*$/.match(input)
end
# NUMBER VALIDATOR
def number?(input)
  integer?(input) || float?(input)
end
# YEARS TO MONTHS = N
def years_to_months(years)
  years * 12
end
# APR TO MONTHLY
def apr_to_monthly(year_rate)
  year_rate / 12.0
end
# MONTHLY TO DECIMAL = J
def monthly_to_decimal(monthly)
  monthly * 0.01
end
loan_amount = P
m = p * (j / (1 - (1 + j)**(-n)))
monthly_payment = loan_amount * (monthly_rate / (1-(1+monthly_rate)**(-loan_months)))
=end # PEDAC
#=begin MY CODE
# INTEGER VALIDATOR
def integer?(input)
  /^-?\d+$/.match(input)
end  
# FLOAT VALIDATOR
def float?(input)
  /\d/.match(input) && /^-?\d*\.?\d*$/.match(input)
end
# NUMBER VALIDATOR
def number?(input)
  integer?(input) || float?(input)
end
# YEARS TO MONTHS = N
def years_to_months(years)
  years * 12
end
# APR TO MONTHLY
def apr_to_monthly(year_rate)
  year_rate.to_f / 12.0 # ADDED .to_f
end
# MONTHLY TO DECIMAL = J
def monthly_to_decimal(monthly)
  monthly.to_f * 0.01 # ADDED .to_f
end
puts "WELCOME TO THE LOAN CALCULATOR!"
loan_amount = '' # IN CASE I NEED IT
year_rate = ''
loan_years = ''

loop do # MAIN LOOP CLOSED!!
  loop do
    puts "How much is your loan?"
    loan_amount = gets.chomp#.to_i
    if number?(loan_amount)
      break
    else
      puts "Please enter an integer only."
    end
  end

  loop do
    puts "What is the Annual Percentage Rate?"
    year_rate = gets.chomp#.to_f
    if number?(year_rate)
      break
    else
      puts "Please enter an integer with a decimal. Ex: 5.0"
    end
  end

  loop do
    puts "How many years would you like to take to pay?"
    loan_years = gets.chomp#.to_i
    if number?(loan_years)
      break
    else
      puts "Please enter an integer only."
    end
  end

# CALCULATIONS AND VARIABLES 1. THIS IS NOT AMORTIZED AND I DON''T THINK IT WORKS RIGHT
=begin KEEP THIS TO WORK FROM
  loan_amount = loan_amount.to_i
  loan_years = loan_years.to_i
  year_rate = year_rate.to_f
  loan_months = years_to_months(loan_years)
  months_only = loan_amount / loan_months
  monthly_rate = apr_to_monthly(year_rate)
  monthly_interest = monthly_to_decimal(monthly_rate) * loan_amount
  monthly_payment = months_only + monthly_interest
  year_total = monthly_payment * 12 # NO INTEREST
  year_interest = monthly_interest * 12 
  total_interest = year_interest * loan_years
  total_amount = total_interest + loan_amount
=end
#=begin THIS IS FOR AMORTIZATION WITH THE FORMULA
  loan_amount = loan_amount.to_i
  loan_years = loan_years.to_i
  year_rate = year_rate.to_f
  loan_months = years_to_months(loan_years)
  months_only = loan_amount / loan_months
  monthly_rate = monthly_to_decimal(apr_to_monthly(year_rate))
  #p test1 = monthly_to_decimal(monthly_rate)
  #p test2 = loan_amount.to_f
  #monthly_interest = monthly_to_decimal(monthly_rate) * loan_amount.to_f
  #monthly_interest = monthly_rate * loan_amount.to_f
  
  #monthly_payment = months_only + monthly_interest
  monthly_payment = loan_amount * (monthly_rate / (1 - (1 + monthly_rate)**(-loan_months)))
  #monthly_payment = loan_amount * (monthly_interest / (1 - (1 + monthly_interest)**(-loan_months)))
  year_total = monthly_payment * 12 # NO INTEREST
  
  
  total_amount = monthly_payment * loan_months
  total_interest = total_amount - loan_amount
  monthly_interest = total_interest / loan_months
  year_interest = monthly_interest * 12 
  # m = monthly payment
  # p = loan amount                  300000
  # j = monthly interest rate        .005
  # n = loan duration in months      360
  # m = p * (j / (1 - (1 + j)**(-n)))
  #monthly_payment = loan_amount * (monthly_rate / (1-(1+monthly_rate)**(-loan_months)))
# p "Loan Amount : #{loan_amount}"
# p "Loan Years : #{loan_years}"
# p "Year Rate : #{year_rate}"
# p "Loan Months : #{loan_months}"
# p "Months Only : #{months_only}"
# p "Monthly Rate : #{monthly_rate}"
# p "Monthly Interest : #{monthly_interest}"
# p "Monthly Payment : #{monthly_payment}"
# p "Year Total : #{year_total}"
# p "Year Interest : #{year_interest}"
# p "Total Interest : #{total_interest}"
# p "Total Amount : #{total_amount}"

#=end
  # RESULTS
  puts "With a loan of $#{loan_amount} at #{year_rate} APR:"
  puts "You will have #{loan_months} monthly payments of $#{sprintf('%.2f', monthly_payment)}."
  puts "Your monthly interest rate is #{sprintf('%.3f', monthly_rate)}%."
  puts "Your monthly interest payment will be $#{sprintf('%.2f', monthly_interest)}."
  puts "Your yearly interest will be $#{sprintf('%.2f', year_interest)}."
  puts "Your total interest will be $#{sprintf('%.2f', total_interest)}."
  puts "Your total payment will be $#{sprintf('%.2f', total_amount)}."
  puts "It would probably be better to pay cash!"
  puts " "
  puts "Would you like to calculate another loan?"
  again = gets.chomp.downcase
  break unless again.downcase.start_with?('y')
end # CLOSES MAIN LOOP
puts "THANK YOU FOR USING LOAN CALCULATOR!"
puts "GOOD LUCK AND ENJOY YOUR PURCHASE!"
# MAYBE CENTER THESE OR BANNERIZER THEM?

=begin NEW PEDAC
loop each payment
each payment subtract 1 month of payment from total loan
             calculate new payment 1 month(months_only) + new interest(monthly_interest)

 also make a new method called payment
it deducts 1 month of $ from loan_amount
it deducts 1 month from loan_months
=end
#=begin THEIR CODE
def prompt(message)
  Kernel.puts("=> #{message}")
end

loop do
  prompt("Welcome to Mortgage Calculator!")
  prompt("-------------------------------")

  prompt("What is the loan amount?")

  amount = ''
  loop do
    amount = Kernel.gets().chomp()

    if amount.empty?() || amount.to_f() < 0
      prompt("Must enter positive number.")
    else
      break
    end
  end

  prompt("What is the interest rate?")
  prompt("(Example: 5 for 5% or 2.5 for 2.5%)")

  interest_rate = ''
  loop do
    interest_rate = Kernel.gets().chomp()

    if interest_rate.empty?() || interest_rate.to_f() < 0
      prompt("Must enter positive number.")
    else
      break
    end
  end

  prompt("What is the loan duration (in years)?")

  years = ''
  loop do
    years = Kernel.gets().chomp()

    if years.empty?() || years.to_i() < 0
      prompt("Enter a valid number")
    else
      break
    end
  end

  annual_interest_rate = interest_rate.to_f() / 100
  monthly_interest_rate = annual_interest_rate / 12
  months = years.to_i() * 12

  monthly_payment = amount.to_f() *
                    (monthly_interest_rate /
                    (1 - (1 + monthly_interest_rate)**(-months)))

  prompt("Your monthly payment is: $#{format('%.2f', monthly_payment)}")

  prompt("Another calculation?")
  answer = Kernel.gets().chomp()

  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for using the Mortgage Calculator!")
prompt("Good bye!")
#=end THEIR CODE