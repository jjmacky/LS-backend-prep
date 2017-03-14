######################################
#Exercise 1
######################################
puts "This is excercise 1:"

family = {  uncles: ["bob", "joe", "steve"],
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank","rob","david"],
            aunts: ["mary","sally","susan"]
          }

# Whole family
family_array = []
family.each { |key, value| family_array << value }
family_array = family_array.flatten
p family_array

# Immediate family
family = {  uncles: ["bob", "joe", "steve"],
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank","rob","david"],
            aunts: ["mary","sally","susan"]
          }

immediate_family = family.select { |k,v| k == :sisters || k == :brothers }
immediate_family = immediate_family.values.flatten
p immediate_family
puts # add empty line

######################################
#Exercise 2
######################################
puts "This is excercise 2:"

hash1 = {name1: "bob", name2: "larry"}
hash2 = {name3: "sarah", name4: "bridget"}

hash1.merge(hash2)
p hash1
hash1.merge!(hash2)
p hash1

######################################
#Exercise 3
######################################
puts "This is excercise 3:"

# Reuse hash1 from previous example
hash1.each_key { |key| puts key}
hash1.each_value { |value| puts value}
hash1.each_pair { |key, value| puts "#{key}: #{value}"}


######################################
#Exercise 4
######################################
puts "This is excercise 4:"

person = {name: 'Bob', occupation: 'web developer', hobbies: 'painting'}
puts person.fetch(:name)
# or...
puts person[:name]


######################################
#Exercise 5
######################################
puts "This is excercise 5:"

# Reuse person hash from pervious example
puts person.has_value?("web developer")
# Add extra line breaks before next example
puts
puts
puts

######################################
#Exercise 6
######################################
puts "This is excercise 6:"

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']
hash = {}

words.each_index do |i|      
  key = words[i].chars.sort.join  
   if hash.has_key?(key)
     hash[key] << words[i]
   else
    hash[key] = [words[i]]
   end
end

hash.each_value { |val| puts "#{val}" }
# or
hash.each_value { |val| p val }









