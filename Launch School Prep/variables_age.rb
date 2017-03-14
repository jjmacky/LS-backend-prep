######################################
#Exercise 1
######################################

puts "How old are you?"
age = gets.chomp.to_i
age_increments = [10, 20, 30, 40]

for i in 0..3
  puts "In" + " " + age_increments[i].to_s + " " + "years you will be:"
  puts age + age_increments[i]
end
