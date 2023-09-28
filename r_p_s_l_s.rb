=begin
In this assignment, we'll' build a Rock Paper Scissors game.
The game flow should go like this:

the user makes a choice
the computer makes a choice
the winner is displayed
=end
=begin PEDAC
greeting
get input
display input
input is one of 3
computer has array of 3 choices to sample from
display computer choice
store player vs computer variables

determine winner
  if same, prompt for new input
  define rules a > b, b > c, c > a
  case statement?
    player has 3 a,b,c
      a, comp b win, comp c lose
      b, comp a lose, comp c win
      c, comp a win, comp b lose
      This is perfect for ternarys
      returning winning status
  display winner and ask again
  yes play again, no thank you and gn.
=end
#=begin MY CODE
puts "Welcome to ROCK PAPER SCISSORS!"

player = nil
computer = nil
choices = ['ROCK', 'PAPER', 'SCISSORS', 'LIZARD', 'SPOCK']

loop do
  loop do
    puts "Choose '0' for 'ROCK'"
    puts "Choose '1' for 'PAPER'"
    puts "Choose '2' for 'SCISSORS'"
    puts "Choose '3' for 'LIZARD'"
    puts "Choose '4' for 'SPOCK'"
    loop do
      player = gets.chomp.to_i
      break if player >= 0 && player <= 4
      puts "Please choose '0', '1', '2', '3', or '4'."
    end

    puts "You have chosen #{choices[player]}!"
    puts "GOOD LUCK!"

    computer = choices.sample
    puts "The Computer Chooses: #{computer}!"
    break if computer != choices[player]
    puts "The Computer Chose the same thing!"
    puts "Please Choose again!"
  end
=begin # IF THEN CODE
  if player == 0 # IF PLAYER HAS ROCK
    winner = computer == ('PAPER' || 'SPOCK') ? "COMPUTER" : "PLAYER"
  elsif player == 1 # IF PLAYER HAS PAPER
    winner = computer == ('SCISSORS' || 'LIZARD') ? "COMPUTER" : "PLAYER"
  elsif player == 2 # IF PLAYER HAS SCISSORS
    winner = computer == ('ROCK' || 'SPOCK') ? "COMPUTER" : "PLAYER"
  elsif player == 3 # IF PLAYER HAS LIZARD
    winner = computer == ('ROCK' || 'SCISSORS') ? "COMPUTER" : "PLAYER"
  else # IF PLAYER HAS SPOCK
    winner = computer == ('PAPER' || 'LIZARD') ? "COMPUTER" : "PLAYER"
  end
=end
  case player
  when 0
    winner = computer == ('PAPER' || 'SPOCK') ? "COMPUTER" : "PLAYER"
  when 1
    winner = computer == ('SCISSORS' || 'LIZARD') ? "COMPUTER" : "PLAYER"
  when 2
    winner = computer == ('ROCK' || 'SPOCK') ? "COMPUTER" : "PLAYER"
  when 3
    winner = computer == ('ROCK' || 'SCISSORS') ? "COMPUTER" : "PLAYER"
  when 4
    winner = computer == ('PAPER' || 'LIZARD') ? "COMPUTER" : "PLAYER"
  end

  puts "THE #{winner} IS THE WINNER!"
  puts "WOULD YOU LIKE TO PLAY AGAIN?"
  again = gets.chomp
  again.downcase.start_with?('y') ? next : break
end
puts "GOODBYE"
#=end
