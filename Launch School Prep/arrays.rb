######################################
#Exercise 1
######################################
puts "This is excercise 1:"
number = 3
arr = [1, 2, 3, 5, 7, 9, 11]
arr.each do |element| 
  if element == number
    puts "#{number} is in the array"
  end
end

######################################
#Exercise 2
######################################
puts "This is excercise 2:"

arr = [["test", "hello", "world"],["example", "mem"]]

# Different ways to print example
puts arr.last.first
puts arr[1][0]
puts arr.flatten[3]

######################################
#Exercise 3
######################################
puts "This is excercise 3:"
names = ['bob', 'joe', 'susan', 'margaret']
puts names

puts # add empty line between array printouts

names[names.index('margaret')] = 'jody'
puts names

######################################
#Exercise 7
######################################
puts "This is excercise 7:"

arr1 = [3, 5, 32, 87, 132, 8, 43, 6]
arr2 = arr1.map{ |element| element + 2 }

p arr1
p arr2
