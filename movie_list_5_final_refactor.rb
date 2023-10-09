# movie_list_5_final
# SURPRISE! THIS IS YOUR FIRST CRUD APP!!
# Create Read Update Delete

system('clear')
sleep(1)
movies = {
  'Jedi' => 4,
  'Empire' => 5
}
def prompt(str)
  "--> Type #{str}"
end

def space
  puts ' '
end

def best(hash)
  hash.max_by { |_, v| v }
end

def worst(hash)
  hash.min_by { |_, v| v }
end

def options
  puts prompt("'add' to add a movie.")
  puts prompt("'display' to display all movies.")
  puts prompt("'update' to update a movie.")
  puts prompt("'rank' to rank movies.")
  puts prompt("'best' to see which movie is best.")
  puts prompt("'worst' to see which movie is worst.")
  puts prompt("'delete' to delete a movie.")
  puts prompt("'?' to see options again.")
  puts prompt("'exit' to quit.")
end

puts 'These are your movies:'
space
movies.each_key { |k| puts k }
space
sleep(1)
options

sleep(1)
loop do
  space
  puts 'What would you like to do?'

  choice = gets.chomp.downcase
  space
  case choice
  when 'add'
    puts 'What movie would you like to add?'
    title = gets.chomp
    space
    if movies[title].nil?
      puts 'What rating does the movie have?'
      rating = gets.chomp.to_i
      movies[title] = rating
      space
      puts "#{title} has been added with a rating of #{rating}."
    else
      puts "SEAT'S TAKEN! Its rating is #{movies[title]}."
    end
  when 'update'
    puts 'What movie would you like to update?'
    title = gets.chomp
    space
    if movies[title].nil?
      puts "This movie isn't in the hash."
      puts 'Choose an existing movie.'
    else
      puts 'Enter new rating:'
      rating = gets.chomp.to_i
      movies[title] = rating
      space
      puts "The movie: #{title}, now has a rating of: #{rating}"
    end
  when 'display'
    movies.each do |key, value|
      puts "#{key}: #{value}"
    end
  when 'rank'
    ranked = movies.sort_by { |_, value| -value }
    ranked.size.times do
      puts "#{ranked[0][0]}: #{ranked[0][1]}"
      ranked.shift
    end
  when 'delete'
    puts 'What movie would you like to delete?'
    title = gets.chomp
    if movies[title].nil?
      space
      puts "This movie isn't in the hash."
      puts 'Choose an existing movie.'
    else
      movies.delete(title)
      space
      puts "So it goes, 86: #{title}"
    end
  when 'best'
    puts "#{best(movies)[0]} is the best movie."
    puts "It has a rating of #{best(movies)[1]}."
  when 'worst'
    puts "#{worst(movies)[0]} is the worst movie."
    puts "It has a rating of #{worst(movies)[1]}."
  when '?'
    options
    next # the options are displayed and the loop starts again
  when 'exit'
    puts 'END OF LINE.'
    break # this breaks the case and is the real end of this program
  when 'end'
    puts 'BEAUTIFUL, FRIEND.' # easter egg ending
    break  # this breaks the case and is the real end of this program
  else
    puts "Sorry, I didn't understand you. Please Choose Again."
  end
end

sleep(1)
system('clear')
sleep(0.5)
