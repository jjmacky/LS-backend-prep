######################################
#Exercise 1
######################################
puts "Exercise 1"
puts "James" + " " + "McCammon"
puts ""

######################################
#Exercise 2
######################################
puts "Exercise 2"
puts "Please enter a 4 digit number."
number = gets.to_i
if number > 9999 || number < 1000
  puts "I'm sorry, your number is not 4 digits."
end

thousands = number    % 10000
hundreds  = thousands % 1000
tens      = hundreds  % 100
ones      = tens      % 10

puts "The thousands place is " + (thousands / 1000).to_s + "."
puts "The hundreds place is "  + (hundreds  / 100).to_s + "."
puts "The tens place is "      + (tens      / 10).to_s + "."
puts "The ones place is "      + (ones      / 1).to_s + "."
puts ""

######################################
#Exercise 3
######################################
puts "Exercise 3"
movie_list = {:"Before Sunrise"      => 1995,
              :"The Bourne Identity" => 2002,
              :"Children of Men"     => 2006,
              :"Some Like it Hot"    => 1959,
              :"Star Wars"           => 1977}

puts movie_list[:"Before Sunrise"]
puts movie_list[:"The Bourne Identity"]
puts movie_list[:"Children of Men"]
puts movie_list[:"Some Like it Hot"]
puts movie_list[:"Star Wars"]
puts ""

######################################
#Exercise 4
######################################
puts "Exercise 4"
movie_array = [1995, 2002, 2006, 1959, 1977]

for i in 0..(movie_array.length - 1)
  puts movie_array[i]
end
puts ""

######################################
#Exercise 5
######################################
puts "Exercise 5"
five_factorial  = 5 * 4 * 3 * 2 * 1
six_factorial   = 6 * five_factorial
seven_factorial = 7 * six_factorial 
eight_factorial = 8 * seven_factorial

puts five_factorial
puts six_factorial
puts seven_factorial
puts eight_factorial
puts ""

######################################
#Exercise 6
######################################
puts "Exercise 6"

puts 3958.4      ** 2
puts 435208.222  ** 2
puts 94570.48957 ** 2
puts ""