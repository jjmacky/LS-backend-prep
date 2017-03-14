######################################
#Exercise 1
######################################
puts "This is excercise 1:"

arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
arr.each { |element| puts element }

puts
puts


######################################
#Exercise 2
######################################
puts "This is excercise 2:"

arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
puts arr.select! { |element| element > 5 }
# or
arr.each { |number| puts number if number > 5 }

puts
puts


######################################
#Exercise 3
######################################
puts "This is excercise 3:"

arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
puts new_arr = arr.select { |element| element.odd? }

puts
puts


######################################
#Exercise 4
######################################
puts "This is excercise 4:"

arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
arr.push(11)
arr.unshift(0)
puts arr

puts 
puts


######################################
#Exercise 5
######################################
puts "This is excercise 5:"

arr.pop
arr.push(3)
puts arr

puts 
puts


######################################
#Exercise 6
######################################
puts "This is excercise 6:"

arr.uniq!
puts arr

puts
puts


######################################
#Exercise 8
######################################
puts "This is excercise 8:"

hash1 = {a: "value 1", b: "value 2", c: "value 3", d: "value 4"}
hash2 = {:a => "value 1", :b => "value 2", :c => "value 3", :d => "value 4"}

puts hash1
puts hash2

puts
puts

######################################
#Exercise 9
######################################
puts "This is excercise 9:"

h = {a:1, b:2, c:3, d:4}
puts h[:b]
h[:e] = 5
puts h
h.each do |key, val|
  if val < 3.5
    h.delete(key)
  end
end

# or  h.delete_if { |k, v| v < 3.5 }

puts h

puts
puts

######################################
#Exercise 12
######################################
puts "This is excercise 12:"

contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]
contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

contacts["Joe Smith"][:email] = contact_data[0][0]
contacts["Joe Smith"][:address] = contact_data[0][1]
contacts["Joe Smith"][:phone] = contact_data[0][2]
contacts["Sally Johnson"][:email] = contact_data[1][0]
contacts["Sally Johnson"][:address] = contact_data[1][1]
contacts["Sally Johnson"][:phone] = contact_data[1][2]

puts contacts
puts
puts

######################################
#Exercise 13
######################################
puts "This is excercise 13:"

puts "Joe's email is #{contacts["Joe Smith"][:email]}."
puts "Salley's phone number is #{contacts["Sally Johnson"][:phone]}."

puts
puts


######################################
#Exercise 14
######################################
puts "This is excercise 14:"

# My Answer
contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]
contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

contacts.each_key do |key|
  contacts[key][:email] = contact_data.first.shift
  contacts[key][:address] = contact_data.first.shift
  contacts[key][:phone] = contact_data.first.shift
  contact_data.shift
end

puts contacts

# Solution from Launch Academy
contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]
contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}
fields = [:email, :address, :phone]

contacts.each_with_index do |(name, hash), idx|
  fields.each do |field|
    hash[field] = contact_data[idx].shift
  end
end

puts
puts


######################################
#Exercise 15
######################################
puts "This is excercise 15:"

arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']
arr.delete_if { |element| element.start_with?('s')}
puts arr

arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']
arr.delete_if { |element| element.start_with?('s', 'w') }
puts arr

puts
puts

######################################
#Exercise 16
######################################
puts "This is excercise 15:"

a = ['white snow', 'winter wonderland', 'melting ice',
     'slippery sidewalk', 'salted roads', 'white trees']

p a.map { |element| element.split }.flatten












