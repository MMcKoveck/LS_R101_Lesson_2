=begin
In this assignment, we'll' build a Rock Paper Scissors game. The game flow should go like this:

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
loop do
  loop do
    
    choices = ['ROCK', 'PAPER', 'SCISSORS'] 
    puts "Choose '0' for 'ROCK'"
    puts "Choose '1' for 'PAPER'"
    puts "Choose '2' for 'SCISSORS'"
    
    loop do
      player = gets.chomp.to_i
      break if player >= 0 && player <= 2
      puts "Please choose '0', '1', or '2'."
    end
    
    puts "You have chosen #{choices[player]}!"
    puts "GOOD LUCK!"
    
    computer = choices.sample
    puts "The Computer Chooses: #{computer}!"
    break if computer != choices[player]
    puts "The Computer Chose the same thing!"
    puts "Please Choose again!"
  end
  
  if player == 0
    winner = (computer == 'PAPER') ? "COMPUTER" : "PLAYER"
  elsif player == 1
    winner = (computer == 'SCISSORS') ? "COMPUTER" : "PLAYER"
  else
    winner = (computer == 'ROCK') ? "COMPUTER" : "PLAYER"
  end
  
  puts "THE #{winner} IS THE WINNER!"
  puts "WOULD YOU LIKE TO PLAY AGAIN?"
  again = gets.chomp
  again.downcase.start_with?('y') ? next : break
end
puts "GOODBYE"