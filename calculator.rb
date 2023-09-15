
def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num.to_i() != 0
end

def operation_to_message(op)
  case op
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

num1 = ''
num2 = ''

prompt("Welcome to Calculator! Enter your name:")

name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt("Make sure to use a vslid name.")
  else
    break
  end
end

prompt("Hi #{name}!")

loop do # MAIN LOOP
  loop do
    prompt("What's the first number?")
    num1 = Kernel.gets().chomp()

    if valid_number?(num1)
      break
    else
      prompt("Hmm... that doesn't look like a valid number.")
    end
  end

  loop do
    prompt("What's the second number?")
    num2 = Kernel.gets().chomp()

    if valid_number?(num2)
      break
    else
      prompt("Hmm... that doesn't look like a valid number.")
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
      prompt("Must choose 1, 2, 3, or 4.")
    end
  end

  prompt("#{operation_to_message(operator)} the numbers #{num1} and #{num2}.")

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

  prompt("The result is #{result}.")

  prompt("Do you want to perform another calculation? (Y to calculate again)")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for using calculator!")

#=begin MODDING OPTIONS
==> INTEGER VALIDATION
Option 1 - this is the easiest way to improve the method. It will handle "0" correctly.

Copy Code
def integer?(input)
  input.to_i.to_s == input
end
This isn't' perfect, however, because while "0" will return true, if we input "00", 
this method will return false.

Option 2 - use regex. Slightly more complex, but we're' using the \d regular expression to 
test against all digits. The ^ means start of string, the + means "one or more" 
(of the preceding matcher), and the $ means end of string. Therefore, it has to be an integer, 
and a float, like 4.5 won't match. When there's a match, 
the match method will return a MatchData object, which will evaluate to true. 
When there's no match, it'll return nil, which will evaluate to false.

Copy Code
def integer?(input)
  /^-?\d+$/.match(input)
end
Don't worry too much about understanding this option if you're not already familiar with regex. 
We do have a book on regex, but we don't' expect you to explore this topic until later in the curriculum.

Option 3 - use built-in conversion method. In Ruby, there's' a method called Kernel.Integer 
that will convert parameters to the method into an integer object. 
It will, however, raise a TypeError if the input is not a valid integer, 
so you'll' have to handle that. Note: yes, that's' a capitalized method in Ruby -- 
fortunately, that doesn't' happen often.

Note: trailing rescue is a "code smell", so be aware of that. In this specific instance, 
it's ok, but don't fall into a habit of suppressing errors this way.

Copy Code
def integer?(input)
  Integer(input) rescue false
end
Option 1 is really what you're' expected to come up with at this point. 
The other two are merely to show you that there are frequently multiple ways 
to do the same thing in Ruby, with varying degrees of differences.

==> NUMBER VALIDATION
We'll' create a method that tests to see whether the input is either a number or a float.

Copy Code
def number?(input)
  integer?(input) || float?(input)
end
We already have the integer? method, so all we need to do is implement a float? method.

Option 1 -- just like before, this is the easiest way to check for floats.

Copy Code
def float?(input)
  input.to_f.to_s == input
end
This method has an edge case though:

Copy Code
2.6.2 :001 > '1.' == '1.'.to_f.to_s
=> false
2.6.2 :002 > '1.'.to_f
=> 1.0
As you can see, to_f converts 1. to 1.0, which does not match the original string.

Option 2 -- use regex. This regex is similar to the regex in the integer? method, 
except we have to account for more possible formats. 
We can combine two validations to verify that the input is a valid float. 
The first validation verifies that there is at least one digit in the input. 
The second validation incorporates the * which stands for "zero or more", 
and the ? which stands for "zero or one". 
This validation can be read as "zero or more digits, followed by an optional period, 
followed by zero or more digits." This validation will accept all of these formats: 
11.11, 11., .11, but not a period by itself. Notice that we had to prefix the . with a backslash. 
That is because . matches any single character in regex. 
By escaping it, we tell Ruby that we are looking for the actual period character.

Copy Code
def float?(input)
  /\d/.match(input) && /^-?\d*\.?\d*$/.match(input)
end
Option 3 -- use the Kernel.Float method, which is analogous to the Kernel.Integer method from earlier. 
Just like that method, Float also raises an exception if you don't' give it a valid float, 
so you have to handle it. Note: trailing rescue is a "code smell", so be aware of that. 
In this specific instance, it's ok, but don't fall into a habit of suppressing errors this way.

Copy Code
def float?(input)
  Float(input) rescue false
end
Of the 3 options, option 1 is probably easiest to follow. 
Using regex seems like a good idea, until you start to run into very subtle edge cases with it.

One last thing to mention is that in programming, no matter what language you use, 
there's' always the floating point precision problem. https://en.wikipedia.org/wiki/Floating_point#Accuracy_problems
Be aware of that when dealing with large numbers, or working with the result of a division operation.

==> CONFIGURATION FILE
First, we need to extract the messages into a configuration file. We can choose any format, 
from plain .txt file to json to csv. Ruby has libraries that can help with parsing any of those formats. 
Most Rubyists prefer the yaml format, so we'll use that. 
We'll extract our messages into a file called calculator_messages.yml. 
Make sure this file is created in the same directory as your calculator program.
--------------------
calculator_messages.yml
Copy Code

welcome: "Welcome to Calculator! Enter your name:"
valid_name: "Make sure to enter a valid name."

# ... rest of file omitted for brevity
-------------------
As you can see, it's' just a list of key/value pairs, almost like a hash. 
Next, we'll' parse this .yml file using a module that comes with the Ruby standard Library.

To use that module, in your calculator.rb file, add require 'yaml' and you can 
parse the calculator_messages.yml file, then save the parsed data into a variable.
--------------------
calculator.rb
Copy Code
# at the top of file

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
------------------
Before continuing, check out what MESSAGES is. You can do so with puts MESSAGES.inspect. 
  Go do that now. We'll' wait....

If you did that, you should have seen that MESSAGES is a normal Ruby hash. 
The yaml gem parsed the contents of the yml file, and created a Ruby hash for us. 
This is convenient, because we know how to work with hashes.

Now, all we have to do is replace all hard-coded strings with the key in the MESSAGES hash.
--------------
Copy Code
# replace this:
prompt("Welcome to Calculator! Enter your name:")

# with this:
prompt(MESSAGES['welcome'])
----------------
Go ahead and replace all the prompt calls. Your program is now using a configuration file!

==> DIFFERENT LANGUAGES
First, we'll have to reorganize our yml configuration a little bit to account for different languages. We'll nest the message keys under a top-level language, thereby organizing all the values. Here's an example:

Copy Code
# reorganizing the calculator_messages.yml

en:
  welcome: "Welcome to Calculator! Enter your name:"
  valid_name: "Make sure to enter a valid name."
es:
  welcome: "Bienvenido a la calculadora! Entre su nombre:"
  valid_name: "Asegúrese de entrar un nombre válido."
Note that we're using two top-level keys here to distinguish between English messages and Spanish messages. We could have as many top-level keys as we want to -- one for each language our program supports.

Next, we have to study how this change affects our MESSAGES hash. If we do a puts MESSAGES.inspect in our program, we'll see that it's still a hash, except it's now a nested hash. This means we have to grab the language first, then the message. For example, we can get the Spanish welcome message like this:

Copy Code
MESSAGES['es']['welcome']    # => Bienvenido a la calculadora! Entre su nombre:
Because we'll need the language key every time we reference the message, let's move that to a method we can call. That way, we can pass in the language to the method, which can then reference the MESSAGES hash.

calculator.rbCopy Code
# at top of file after initializing MESSAGES

def messages(message, lang='en')
  MESSAGES[lang][message]
end
This now means we can do this in our program:

Copy Code
# english
prompt(messages('welcome'))       # => Welcome to Calculator! Enter your name:

# english
prompt(messages('welcome', 'en')) # => Welcome to Calculator! Enter your name:

# spanish
prompt(messages('welcome', 'es')) # => Bienvenido a la calculadora! Entre su nombre:
The last piece is setting a default language for your program.

Copy Code
# top of calculator.rb

LANGUAGE = 'en'
And finally, whenever you call the prompt, you can do this:

Copy Code
prompt(messages('welcome', LANGUAGE))
If you think that's too verbose, you could move the code around a bit and modify the prompt method:

Copy Code
def prompt(key)
  message = messages(key, LANGUAGE)
  Kernel.puts("=> #{message}")
end

# now you can just do:
prompt('welcome')
Now, when non-English users want to use your calculator, all they have to do is change the LANGUAGE setting, provided you have translated the messages for them already.
  