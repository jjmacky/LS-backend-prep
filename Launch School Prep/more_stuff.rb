######################################
#Exercise 1
######################################
puts "This is excercise 1:"

def lab_method(string)
  if /lab/.match(string.downcase)
    puts "We have a match for #{string}."
  else
    puts "We don't have a match for #{string}."
  end
end

lab_method("laboratory")
lab_method("experiment")
lab_method("Pans Labyrinth")
lab_method("elaborate")
lab_method("polar bear")

######################################
#Exercise 4
######################################
puts "This is excercise 4:"

def execute(&block)
  block.call
end

execute { puts "Hello from inside the execute method!" }



