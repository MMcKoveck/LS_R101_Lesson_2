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
    loan_amount = gets.chomp
    if number?(loan_amount)
      break
    else
      puts "Please enter an integer only."
    end
  end

  loop do
    puts "What is the Annual Percentage Rate?"
    year_rate = gets.chomp
    if number?(year_rate)
      break
    else
      puts "Please enter an integer with a decimal. Ex: 5.0"
    end
  end

  loop do
    puts "How many years would you like to take to pay?"
    loan_years = gets.chomp
    if number?(loan_years)
      break
    else
      puts "Please enter an integer only."
    end
  end

  loan_amount = loan_amount.to_i
  loan_years = loan_years.to_i
  year_rate = year_rate.to_f
  loan_months = years_to_months(loan_years)
  months_only = loan_amount / loan_months # NO INTEREST
  monthly_rate = monthly_to_decimal(apr_to_monthly(year_rate))
  monthly_payment = loan_amount * (monthly_rate / (1 - (1 + monthly_rate)**(-loan_months)))
  year_total = monthly_payment * 12 # NO INTEREST
  total_amount = monthly_payment * loan_months
  total_interest = total_amount - loan_amount
  monthly_interest = total_interest / loan_months
  year_interest = monthly_interest * 12

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
