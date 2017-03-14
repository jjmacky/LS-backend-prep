######################################
#Exercise 2
######################################
#
## 2a
#
puts "This is excercise 2a:"

x = 0

while 1
  puts x
  x += 1
  text = gets.chomp.upcase
  if text == 'STOP'
    break
  end
end

#
## 2b
#
puts "This is excercise 2b:"

x = 0
text = ''

until text == 'STOP'
  puts x
  x += 1
  puts "Type STOP to stop:"
  text = gets.chomp.upcase
end

#
## 2c
#
puts "This is excercise 2c:"

x = 0
text = ''

while text != 'STOP'
  puts x
  x += 1
  puts "Type STOP to stop:"
  text = gets.chomp.upcase
end

######################################
#Exercise 3
######################################
#
## 3a
#
puts "This is excercise 3a:"

my_array = ['John', 'Bob', 'larry', 'Steve']
my_array.each { |name| puts name }

#
## 3b
#
puts "This is excercise 3b:"

names = ['John', 'Bob', 'larry', 'Steve']
person_index = 1

names.each do |name|
  puts "Person #{person_index} is #{name}"
  person_index += 1
end


######################################
#Exercise 4
######################################
puts "This is excercise 4"

puts "Please enter a number:"
number = gets.chop.to_i


def countdown(number)
  puts number
  if number > 0
    countdown(number - 1)
  end
end

puts "OK let's start!"
countdown(number)


