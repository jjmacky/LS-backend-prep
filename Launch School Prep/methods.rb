######################################
#Exercise 1
######################################
puts "This is excercise 1:"

def greeting(name)
  "Welcome" + " " + name + "!" + " " + "Ruby loves you!"
end

puts "Please enter your name"
name = gets.chomp
puts greeting(name)
puts

######################################
#Exercise 3
######################################
puts "This is excercise 3:"

def multiply(number_1, number_2)
  number_1 * number_2
end

puts multiply(4, 5)
puts

######################################
#Exercise 5
######################################
puts "This is excercise 5:"
def scream(words)
  words = words + "!!!!"
  puts words
  return words
end

scream("Yippeee")



