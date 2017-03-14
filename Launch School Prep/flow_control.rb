######################################
#Exercise 2
######################################
puts "This is excercise 2:"

def all_caps(string)
  if string.length > 10
    string.upcase
  end
end

puts "Please enter a string."
string = gets.chomp.to_s
puts all_caps(string)
puts

######################################
#Exercise 3
######################################
puts "This is excercise 3a:"

def number_range(number)
  if number > 100
    puts "#{number} is greater than 100."
  elsif number > 50
    puts "#{number} is between 51 and 100."
  else
    puts "#{number} is between 0 and 50." 
  end
end

puts "Please input a number."
number = gets.chomp.to_i
number_range(number)
puts

######################################
#Exercise 5
######################################
puts "This is excercise 5:"
def number_range2(number)
  range = case
  when number > 100
    puts "Number is greater than 100"
  when number > 50
    puts "Number is between 51 and 100"
  else
    puts "Number is between 0 and 50"
  end
  range
end

puts "Please input a number."
number = gets.chomp.to_i
number_range2(number)




