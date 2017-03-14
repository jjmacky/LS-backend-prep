####################################################################
# First Reverse
####################################################################

puts
puts
puts "***** First Reverse *****"


# My first answer
def StringReverse1(str)
  new_str = ""
  (str.length-1).downto(0).each { |i| new_str = new_str + str[i] }
  return new_str
end

# My second answer
def StringReverse2(str)
  new_str = []
  str.each_char { |char| new_str.unshift(char) }
  return new_str.join
end

# Jun Park's answer
def FirstReverse(str)
  result = ""
  result += str.slice!(-1) until str.length == 0
  result
end


puts str = "This is a test string."
puts StringReverse1(str)
puts StringReverse2(str)
puts FirstReverse(str)


####################################################################
# First Factorial
####################################################################

puts
puts
puts "***** First Factorial *****"


# My first answer
def FirstFactorial1(num)
  return 1 if num <= 1
  return num * FirstFactorial1(num - 1)
end

# My second answer
def FirstFactorial2(num)
  factorial = 1
  until num <= 1
    factorial *= num
    num -= 1
  end
  return factorial
end

# Jun Park's answer
def FirstFactorial(num)
    num == 0 ? 1 : num * FirstFactorial(num - 1)
end

puts num = 7
puts FirstFactorial1(num)
puts FirstFactorial2(num)
puts FirstFactorial(num)


####################################################################
# Longest Word
####################################################################
# Find longest word. If two words are equally long choose the first
# one.

puts
puts
puts "***** Longest Word *****"


# My first answer
def LongestWord1(sen)
  longest_word = ""
  sen.scan(/\w+/).each do |word|
    longest_word = word if word.length > longest_word.length
  end
  return longest_word
end


# My second answer
def LongestWord2(sen)
  sen.scan(/\w+/).inject do |longest, word| 
    word.length > longest.length ? word : longest
  end
end

# My third answer
def LongestWord3(sen)
  sen.scan(/\w+/).max_by(&:length)
end

# My fourth answer (modified from StackExchange)
def LongestWord4(sen)
  sen.scan(/\w+/).group_by(&:length).max.last.first
end

puts sen = "a confusing /:sentence:/ conplutty [ this is not!!!!!!!~"
puts LongestWord1(sen)
puts LongestWord2(sen)
puts LongestWord3(sen)
puts LongestWord4(sen)



####################################################################
# Letter Changes
####################################################################
# Replace every letter in the string with the letter following it in 
# the alphabet (ie. c becomes d, z becomes a). Then capitalize every 
# vowel in this new string (a, e, i, o, u) and finally return this 
# modified string. 

puts
puts
puts "***** Letter Changes *****"

# Onlnie anwser
def LetterChanges1(str)
  converted = str.gsub(/[a-zA-Z]/) do |c|  
      if c == 'z' or c == 'Z'
        'a'   
      else
        (c.ord + 1).chr
      end
  end
  return converted.tr!('aeiou', 'AEIOU')         
end

# My modified version of online anwser
def LetterChanges2(str)
  converted = str.gsub(/[a-zA-Z]/) do |char|  
      'a' if char == 'z' or char == 'Z'
      char.next  
  end
  return converted.tr!('aeiou', 'AEIOU')         
end

puts str = "fun times!"
puts LetterChanges1(str)
puts LetterChanges2(str)


####################################################################
# Simple Adding
####################################################################
# Sum from one to the given number.
# Below notice three different ways to create an array of numbers.

puts
puts
puts "***** Simple Adding *****"

# My first answer
def SimpleAdding1(num)
  return (1..num).to_a.reduce(&:+)
end

# My second answer
def SimpleAdding2(num)
  numbers = Array (1..12)
  sum = 0
  numbers.each { |number| sum += number }
  return sum
end

# My third answer (modified from StackExchange)
def SimpleAdding3(num)
  numbers = *(1..num)
  return numbers.inject(0) { |sum, number| sum + number }
  # Or even shorter this version below
  # numbers.inject(0, :+)
end

p num = 12 # 78
p SimpleAdding1(num)
p SimpleAdding2(num)
p SimpleAdding3(num)


####################################################################
# Letter Capitalize
####################################################################
# This challenge requires you to capitalize the first letter of 
# each word. 

puts
puts
puts "***** Letter Capitalize *****"


# Official answer from website
def LetterCapitalize1(str)
  words = str.split(" ")
  (0..words.count - 1).each do |i|
     words[i] = words[i][0, 1].upcase + words[i][1..-1]
  end
  return words.join(" ")         
end

# Second official answer from website
def LetterCapitalize2(str)
  return str.gsub(/\w+/) { |w| w.capitalize }
end

# Jun Park's answer
def LetterCapitalize3(str)
  str.scan(/\w+/).map!(&:capitalize).join(' ')
end


puts str = "this is a sample sentence to test."
puts LetterCapitalize1(str)
puts LetterCapitalize2(str)
puts LetterCapitalize3(str)


####################################################################
# Simple Symbols
####################################################################
# Check a string of symbols, letters, and numbers to ensure each
# leter is surrounded on both sides by a + symbol. Return true or
# false

puts
puts
puts "***** Simple Symbols *****"

# My first answer
# Uses lookaheads and lookbehinds that I found on StackOverflow
# and then modifed to pull out letters surrounded by a +. This
# is compared against a scan that pulls out all letters. If these
# two arrays are the same we should return true.
def SimpleSymbols1(str)
  return str.scan(/[a-z]/) == str.scan(/(?<=\+)[a-z](?=\+)/)
end

# Official answer from website
def SimpleSymbols2(str)

  # pad the strings so that if a character exists at the beginning
  # of the string for example, we don't get on out-of-bounds error by
  # trying to get the character before it
  str = '=' + str + '='
  
  # loop through the entire string
  (0..str.length - 1).each do |i|

    # check to see if current character is an alphabetic character 
    if str[i] =~ /[A-Za-z]/

      # check to see if a + symbol is to the left and right
      # if not, then we know this string is not valid
      if str[i - 1] != '+' || str[i + 1] != '+'
        return 'false'
      end
    end
  end
  return 'true'         
end
    
# June Park's answer
def SimpleSymbols3(str)
  alph = ('a'..'z').to_a
  str.chars.each_with_index do |c, i|
    prev, foll = str[i - 1], str[i + 1]
    if alph.include?(c)
      if i > 0 && i < str.length - 1
        return false if prev != "+" || foll != "+"
      elsif i == 0 || i == str.length - 1
        return false
      end
    end
  end
  true
end

puts str = "+d+=+f+3=+s+"
puts SimpleSymbols1(str)
puts SimpleSymbols2(str)
puts SimpleSymbols3(str)

puts str = "+d=+fdd+3=+s+"
puts SimpleSymbols1(str)
puts SimpleSymbols2(str)
puts SimpleSymbols3(str)

####################################################################
# Check Nums
####################################################################
# return the string true if num2 is greater than num1, otherwise 
# return the string false. If the parameter values are equal to each 
# other then return the string -1. 

puts
puts
puts "***** Check Nums *****"

# My first answer
def CheckNums1(num1,num2)
  return num2 > num1 ? true : num1 > num2 ? false : -1   
end

# My second answer
def CheckNums2(num1,num2)
  return -1 if num1 == num2
  return num2 > num1  
end

# Official answer from website
def CheckNums3(num1, num2)
  if num1 == num2
    return '-1'
  elsif num2 > num1
    return 'true'
  else
    return 'false'
  end         
end

puts num1 = 10
puts num2 = 3
puts CheckNums1(num1, num2)
puts CheckNums2(num1, num2)
puts CheckNums3(num1, num2)

puts

puts num1 = 7
puts num2 = 7
puts CheckNums1(num1, num2)
puts CheckNums2(num1, num2)
puts CheckNums3(num1, num2)

puts

puts num1 = 15
puts num2 = 22
puts CheckNums1(num1, num2)
puts CheckNums2(num1, num2)
puts CheckNums3(num1, num2)


####################################################################
# Time Convert
####################################################################
# Have the function TimeConvert(num) take 
# the num parameter being passed and return the number of hours and 
# minutes the parameter converts to (ie. if num = 63 then the output 
# should be 1:3). Separate the number of hours and minutes with a colon. 

puts
puts
puts "***** Time Convert *****"


# My first answer
def TimeConvert1(num)
  return num < 60 ? "0:" + num.to_s : (num/60).to_s + ":" + (num%60).to_s    
end

# My second answer
def TimeConvert2(num)
  hours = num/60
  minutes = num - hours*60
  return hours.to_s + ":" + minutes.to_s    
end

# Official answer from website
def TimeConvert3(num)

  # to get the hours, we divide num by 60 and round it down
  # e.g. 61 / 60 = 1 hour
  # e.g. 43 / 60 = 0 hours
  hours = num / 60

  # to get the minutes, now we use the remainder that we discarded above
  # the modulo operation is represented by the % symbol
  # e.g. 61 % 60 = 1 minute
  # e.g. 43 % 60 = 43 minutes
  minutes = num % 60

  # combine the hours and minutes
  return hours.to_s + ':' + minutes.to_s
         
end

# Jun Park's answer
def TimeConvert4(num)
  hour, minute = 0, num
  (hour += 1 and minute -= 60) until minute < 60
  "#{hour}:#{minute}"
end


puts num = 126
puts TimeConvert1(num)
puts TimeConvert2(num)
puts TimeConvert3(num)
puts TimeConvert4(num)




####################################################################
# Alphabet Soup
####################################################################
# This challenge requires you to alphabetically sort the characters 
# in a string

puts
puts
puts "***** Alphabet Soup *****"


def AlphabetSoup1(str)
  letters = str.chars
  ordered_array = []
  ordered_array = letters.shift(1)

  letters.each do |c|
    flag = true
    for i in 0..ordered_array.length-1
      if ordered_array[i].ord > c.ord
        ordered_array.insert(i,c)
        flag = false
        break
      end
    end
      ordered_array << c if flag
  end

  return ordered_array.join

end

# My/official short solution
def AlphabetSoup2(str)
  return str.split('').sort.join('')
end


puts str = "coderbyte"
puts AlphabetSoup1(str)
puts AlphabetSoup2(str)



####################################################################
# AB Check
####################################################################
# This challenge requires you to alphabetically sort the characters 
# in a string

puts
puts
puts "***** AB Check *****"


# My original bad answer
def ABCheck1(str)
  rotation_amount = 4
  original_str = str.downcase.split('') 
  rotated_str = str.downcase.split('').rotate(-rotation_amount) 
  rotation_amount.upto(original_str.length - 1).any? { |i| (original_str[i] == 'b' && rotated_str[i] == 'a') or (original_str[i] == 'a' && rotated_str[i] == 'b') } 
end
   
# My second good answer
def ABCheck2(str)
  (0..str.length-1).any? do |i| 
    (str[i] == 'a' && str[i+4] == 'b') || 
    (str[i] == 'b' && str[i+4] == 'a')
  end
end

# Jun Park's answer
def ABCheck3(str)
  str.downcase.chars.each_with_index{|c, i| return true if (c == "a" && str[i+4] == "b") || (c == "b" && str[i+4] == "a") }
  false
end


p str = "after badly"
p ABCheck1(str)
p ABCheck2(str)
p ABCheck3(str)

p str = "Laura sobs"
p ABCheck1(str)
p ABCheck2(str)
p ABCheck3(str)


####################################################################
# Vowel Count
####################################################################
# Return the number of vowels the string contains 

# My first answer
def VowelCount(str)
    return str.gsub(/[^aeiou]/,'').size   
end

# My second answer
def VowelCount(str)
  return str.chars.count { |elem| elem =~ /[aeiou]/ }
end


####################################################################
# Word Count
####################################################################
# Reutrn the number of words in the sentence

puts
puts
puts "***** Word Count *****"


# My first answer
def WordCount1(str)
  return str.split(" ").length
end

# My second answer
# Note that in regexp lowercase is inverse of uppercase
# so \s matches white space and \S matches everything
# except white space.
def WordCount2(str)
  return str.scan(/\S+/).count
end

p str = "hello this is a test letter sz!23 z sentence"
p WordCount1(str)
p WordCount2(str)


####################################################################
# ExOh
####################################################################
# Return the string true if there is an equal number of x's and o's, 
# otherwise return the string false. 

puts
puts
puts "***** ExOh *****"


# My first answer
def ExOh1(str)
  return str.count("x") == str.count("o")
end

# Jun Park's answer
def ExOh2(str)
  x, o = 0, 0
  str.chars{|char| (x += 1 if char == "x") or (o += 1 if char == "o") }
  x == o
end

p str = "xxooxoxoxoxox"
p ExOh1(str)
p ExOh2(str)



####################################################################
# Palindrome
####################################################################
# Return the string true if there is an equal number of x's and o's, 
# otherwise return the string false. 

puts
puts
puts "***** Palindrome *****"

# My first answer
def Palindrome1(str)
  str = str.scan(/\w+/).join('')
  return str == str.reverse 
end

# My second answer
def Palindrome2(str)
  str = str.scan(/\w+/).join('')
  result = (0..str.length/2).all? { |i| str[i] == str[-i-1] }
  return result
end

p str = "never odd or even"
p Palindrome1(str)
p Palindrome1(str)

p str = "this is just a random string"
p Palindrome1(str)
p Palindrome1(str)



####################################################################
# Arith Geo
####################################################################
# Return "Arithmetic" if the sequence is arithmetic, return 
# "Geometric" if the sequence is geomtric, return -1 if the sequence
# is neither

puts
puts
puts "***** Arith Geo *****"

# My answer
def ArithGeo1(arr)
  arr_sum = arr.inject(:+)
  arith_sum = arr.size * (arr[0] + arr[-1]) / 2
  r = arr[1].to_f / arr[0]
  geo_sum = arr[0] * ((1-r**arr.size) / (1 - r == 0 ? 1 : 1 - r))
  
  return "Arithmetic" if arr_sum == arith_sum  
  return "Geometric" if arr_sum == geo_sum
  return -1  
end
   

# Jun Park answer   
def ArithGeo2(arr)
  arithmetic, geometric, a_pattern, g_pattern = true, true, arr[1] - arr[0], arr[1].to_f / arr[0]
  
  1.upto(arr.length - 1) do |i|
    arithmetic = false if arithmetic == true && (arr[i] - arr[i-1] != a_pattern)
    geometric = false if geometric == true && (arr[i].to_f / arr[i-1] != g_pattern)
  end
  
  return "Arithmetic" if arithmetic
  return "Geometric" if geometric
  -1
end


p arr = [5,10,15]
p ArithGeo1(arr)
p ArithGeo2(arr)

p arr = [2,4,16,24]
p ArithGeo1(arr)
p ArithGeo2(arr)



####################################################################
# Array Addition I
####################################################################
# Given an array, determine if any group of elements in the array
# add up to the largest element.


puts
puts
puts "***** Array Addition I *****"

# My first horrible answer
def ArrayAdditionI1(arr)
  largest = arr.sort!.pop
  return (1..arr.length).map { |i| arr.combination(i).to_a.map { |elem| elem.reduce(:+) == largest } }.flatten.any?     
end
   

# My second more awesome answer
def ArrayAdditionI2(arr)
  max = arr.sort!.pop
  combinations = (0..arr.size).flat_map{ |size| arr.combination(size).to_a }
  return combinations.any? { |elem| elem.reduce(&:+) == max }
end

# Jun Park's answer
def ArrayAdditionI3(arr)
  sums = []
  largest = arr.sort!.pop
  1.upto(arr.length){|i| arr.combination(i).to_a.each{|nums| sums << nums.reduce(:+) }}
  
  sums.include?(largest)
end

# This code helps compare map and flat_map. Combinations naturally creates an array
# of arrays. So when you put it in map, which returns an array of elements, you
# get an array of arrays of arrays. I believe flap_map gets rid of the middle array
# level.

=begin
  arr = [3,5,-1,8,12]
  p arr.combination(1).to_a
  p combinations = (0..arr.size).flat_map { |size| arr.combination(size).to_a }
  p combinations = (0..arr.size).map { |size| arr.combination(size).to_a }
  p combinations = (0..arr.size).map { |size| size + 1 }
  p combinations = (0..arr.size).map { |size| (size + 1000).to_s.chars }
  p combinations = (0..arr.size).flat_map { |size| (size + 1000).to_s.chars }
=end

p arr = [4, 6, 23, 10, 1, 3]
p ArrayAdditionI1(arr)
p ArrayAdditionI2(arr) 
p ArrayAdditionI3(arr)

p arr = [3,5,-1,8,12]
p ArrayAdditionI1(arr)
p ArrayAdditionI2(arr) 
p ArrayAdditionI3(arr)


####################################################################
# Letter Count I
####################################################################
# Return the first word with the greatest number of repeated letters.

puts
puts
puts "***** Letter Count I *****"


# My horrible answer
def LetterCountI1(str)
  str_array = str.downcase.scan(/\w+/)
  char_rep_array = []
  0.upto(str_array.length-1) { |i| char_rep_array << str_array[i].chars.map { |char| str_array[i].count(char) }.max }
  char_rep_array.max > 1 ? str_array[char_rep_array.index(char_rep_array.max)] : -1   
end

# Cool answer I found on Stack Exchange
# max_by returns object in enum that gives the maximum value from the given block
def LetterCountI2(str)
  return str.split(" ").max_by { |w| w.count(w.chars.max_by { |e| w.count(e) }) }
end

# My even better answer based on the above
# The last line makes sure that the chosen word contains
# multiple letters.
def LetterCountI3(str)
    str = str.downcase.scan(/\w+/)
    longest = str.max_by {|w| w.chars.map { |c| w.count(c) }.max }
    return longest.length == longest.chars.uniq.size ? -1 : longest    
end

p str = "Today, is the greatest day ever!" 
p LetterCountI1(str)
p LetterCountI2(str)
p LetterCountI3(str)

p str = "aabcc ddeeteefef iijjfff" 
p LetterCountI1(str)
p LetterCountI2(str)
p LetterCountI3(str)

p str = "the dog and cat"
p LetterCountI1(str)
p LetterCountI2(str)
p LetterCountI3(str)



####################################################################
# Second GreatLow
####################################################################
# Take the array of numbers stored in arr and return the second 
# lowest and second greatest numbers.

puts
puts
puts "***** Second GreatLow *****"

# My answer
def SecondGreatLow(arr)
  arr.sort!.uniq!
  arr.length > 1 ? "#{arr[1]} #{arr[-2]}" : "#{arr[0]} #{arr[0]}" 
end


p arr = [5,5,89,34,1,1,1,2,65,55,39,82,43]
p SecondGreatLow(arr)



####################################################################
# Division Stringified
####################################################################
# Divide number 1, by number 2 and output with properly formatted 
# commas.

puts
puts
puts "***** Division Stringified *****"

# My answer
def DivisionStringified(num1,num2)
  num_str = (num1/num2.to_f).round.to_s
  num_str.reverse.chars.each_slice(3).map(&:join).join(",").reverse  
end


# Jun Park's better answer
def DivisionStringified(num1,num2)
  (num1.to_f / num2.to_f).round.to_s.reverse.scan(/d?d?d/).join(',').reverse
end

p num1 = 6874
p num2 = 67
p DivisionStringified(num1,num2)


####################################################################
# Division Stringified
####################################################################


# TBD



####################################################################
# Mean Mode
####################################################################
# Divide number 1, by number 2 and output with properly formatted 
# commas.

puts
puts
puts "***** Mean Mode *****"

# My first not awesome answer
def MeanMode(arr)
  mean = arr.reduce(:+)/arr.size.to_f
  mode = 0
  arr.each { |elem| mode = elem if arr.count(elem) > mode } 
  mode == mean ? 1 : 0   
end


# Jun Park answer
def MeanMode(arr)
  mean = arr.inject(:+)/(arr.length)
  mode = arr.select{|r| arr.count(r) > 1}.uniq
  mean == mode[0] ? 1 : 0
end


# My second more awesome answer
mode = arr.max_by{ |elem| arr.count(elem) }
mean = arr.reduce(&:+)/arr.size
mean == mode ? 1 : 0

p arr = [5, 3, 3, 3, 1]



####################################################################
# Dash Insert
####################################################################
# Add a dash between any two odd numbers

puts
puts
puts "***** Dash Insert *****"


# My pretty good answer
def DashInsert1(str)
  arr, c = str.chars, 0
  arr.each_index { |i| c+=1 and str.insert(i+c,"-") if (arr[i].to_i.odd? && arr[i+1].to_i.odd?) }
  return str
end


# Jun Park's kind of confusing answer
def DashInsert2(str)
  str.chars.map.with_index{|n, i| (n.to_i % 2 == 1 && str[i- 1].to_i % 2 == 1 && i != 0) ? "-" + n : n }.join('')
end

p str = "56730"
p DashInsert1(str)
p DashInsert2(str)


####################################################################
# Swap Case
####################################################################
# Change lowercase to uppercase and vice versa

puts
puts
puts "***** Swap Case *****"


# My first terrible, terrible answer
def SwapCase1(str)
  str.chars.map { |char| 
                  (char if char.scan(/[^a-zA-Z]/).length > 0) or 
                  (char.upcase if char.scan(/[a-z]/).length > 0) or 
                  (char.downcase if char.scan(/[A-Z]/).length > 0) }.join
end
   
# My second much better answer
def SwapCase2(str)
  switched_str = str.gsub(/[a-zA-Z]/).map { |elem| (elem.upcase if elem =~ /[a-z]/) || (elem.downcase if elem =~ /[A-Z]/) }
  return switched_str.join('')       
end

# The super efficient answer
def SwapCase3(str)
  return str.swapcase! 
end

p str = "Hello-LOL"
p SwapCase1(str)
p SwapCase2(str)
p SwapCase3(str)



####################################################################
# Number Addition
####################################################################
# Add a dash between any two odd numbers

puts
puts
puts "***** Number Addition *****"

# My first OK answer
def NumberAddition1(str)
  return ("0" + str).split(/[^0-9]/).map { |i| i.to_i }.reduce(:+) 
end
   
# My second better answer
def NumberAddition2(str)
  return str.split(/\D/).map(&:to_i).reduce(&:+) || 0
end

# Jun Park's even better answer
def NumberAddition3(str)
  str.scan(/\d+/).map(&:to_i).inject(0, :+)
end


p str = "55some num7bers"
p NumberAddition1(str)
p NumberAddition2(str)
p NumberAddition3(str)



####################################################################
# Third Greatest
####################################################################
# Return the third longest string. If there are multiple return the
# string that appears last.

puts
puts
puts "***** Third Greatest *****"

# My answer
def ThirdGreatest(strArr)
  length_arr = strArr.map(&:length)
  stopping_condition = length_arr.sort[-3]
  return strArr.reverse.detect { |elem| elem.length == stopping_condition }      
end


p strArr = ["hello", "world", "before", "all"] 
p ThirdGreatest(strArr)



####################################################################
# Powers of Two
####################################################################
# Take the num parameter being passed which will be an integer and 
# return the string true if it's a power of two.

puts
puts
puts "***** Powers of Two *****"

# My first answer
def PowersofTwo1(num)
  until num <= 2.0
    num = num / 2.0
  end 
  return num % 2 == 0     
end

# Jun Park'2 answer
# Takes advantage of bitwise &. If a number is a power of two it's 
# it has one more digit than the number below it. This can be seen
# with the code below.

=begin
  p num = 16
  p num.to_s(2) # convert 16 to binary
  p num -= 1
  p num.to_s(2) # convert 15 to binary
  
  # If you run the code above you'll see the numbers below are 16
  # and 15 in binary, respectivly. If we use binary & we get 0, so
  # we know the original number is a power of 2.
  p 0b10000 & 0b1111

  # For comparison the numbers below are 15 and 14 in binary. If
  # we use a bitwise and you'll see we get the number 14 so our
  # original number (15 in this case) is not a power of 2.
  p 0b1111 & 0b1110
=end

def PowersofTwo2(num)
  return (num & (num - 1)) == 0 ? "true" : "false"
end

p num = 16
p PowersofTwo1(num)
p PowersofTwo2(num)

p num = 15
p PowersofTwo1(num)
p PowersofTwo2(num)


####################################################################
# Additive Persistence
####################################################################
# Find the number's additive persistence which is the number of 
# times you must add the digits in num until you reach a single digit. 
# For example: if num is 2718 then your program should return 2 because 
# 2 + 7 + 1 + 8 = 18 and 1 + 8 = 9 

puts
puts
puts "***** Additive Persistence *****"

# My first answer using recursion
def AdditivePersistence1(num)
  # The stopping condition is num/9.0 > 1, which ensures the number is 1 digit. This has to be represented
  # as a float since if it's an integer it rounds up to 1. If this condition is true it means we've represented
  # our one digit number and so we should simply return, or as I have written for clarity, return 0.
  # Otherwise we know we've got a multidigit number so we should add 1 to our count and try again (using recursion).
  # We first have to split up our number, but this is easiest with a string so we can split this into an array and then
  # add up each element of the array. There are other ways to do this. For example, online I found this method:
  # def digit_sum(n) n.to_s.each_char.map {|c| c.to_i }.reduce(:+) end, although on Stack Exchange some people seem 
  # leary about using .reduce(:+) because of errors in some Ruby 9.1 versions.
  
  num/9.0 > 1 ? 1 + AdditivePersistence1( num.to_s.split('').to_a.inject(0){|sum,x| sum + x.to_i } ) : 0     
end

# My second better answer having seen Jun Park's answer previously
def AdditivePersistence2(num)
  counter = 0
  until num < 10
    counter += 1
    num = num.to_s.chars.map!(&:to_i).reduce(&:+)
  end
  return counter
end

# Jun Park's answer.
def AdditivePersistence3(num)
  count = 0
  until num < 10
    count += 1 and num = num.to_s.chars.map(&:to_i).inject(:+)
  end
  count
end

p num = 2718 # should return 2
p AdditivePersistence1(num)
p AdditivePersistence2(num)
p AdditivePersistence3(num)



####################################################################
# Multiplicative Persistence
####################################################################
# Find the number's Multiplicative Persistence which is the number of 
# times you must multiply the digits in num until you reach a single digit. 

puts
puts
puts "***** Multiplicative Persistence *****"

# My answer
def MultiplicativePersistence1(num)
  counter = 0
  until num < 10
    counter += 1
    num = num.to_s.chars.map(&:to_i).reduce(:*)
  end
  return counter
end
   
# Jun Park's answer. Interesting stuff here.
def MultiplicativePersistence2(num, count=0)
  count += 1 and num = num.to_s.chars.map(&:to_i).reduce(1, :*) until num < 10
  count
end

p = 2718 
p MultiplicativePersistence1(num)
p MultiplicativePersistence2(num, count=0)



####################################################################
# Off Line Minimum
####################################################################
# When you encounter each E in the array return the lowest remaining
# number.

puts
puts
puts "***** Off Line Minimum *****"

# My answer. Jun Park had very similar answer.
def OffLineMinimum(strArr)
  min_arr, results_arr = [], []
  strArr.each { |elem| min_arr << elem and (results_arr << min_arr.delete(min_arr.min) if elem == 'E') }
  return results_arr.join(',')      
end


p strArr = ["5","4","6","E","1","7","E","E","3","2"]
p OffLineMinimum(strArr)



####################################################################
# Changing Sequence
####################################################################
# Return the index when the number switches from increasing to 
# decreasing or vice versa. If there is only one sequence return
# -1.

puts
puts
puts "***** Changing Sequence *****"



def ChangingSequence(arr)
  index =  0.upto(arr.size-2).detect { |i| arr[0] > arr[1] ? arr[i] < arr[i+1] : arr[i] > arr[i+1]}
  return index == nil ? -1 : index    
end

# Jun Park's answer. Not elegant this time.
=begin
def ChangingSequence(arr)
  original = sequence(arr[0], arr[1])
  arr.each_index{|i| return i if i < arr.length- 1 && sequence(arr[i], arr[i+ 1]) != original }
  -1 
end

def sequence(num1, num2)
  (num2 - num1) / (num2 - num1).abs 
end
=end


p arr = [-4, -2, 9, 10]
p ChangingSequence(arr)
p arr = [5, 4, 3, 2, 10, 11]
p ChangingSequence(arr)
p arr = [1, 2, 4, 6, 4, 3, 1] 
p ChangingSequence(arr)



####################################################################
# Overlapping Ranges
####################################################################
# take the array of numbers stored in arr which will contain 5 
# positive integers, the first two representing a range of numbers 
# (a to b), the next 2 also representing another range of integers 
# (c to d), and a final 5th element (x) which will also be a positive 
# integer, and return the string true if both sets of ranges overlap 
# by at least x numbers. For example: if arr is [4, 10, 2, 6, 3] then 
# your program should return the string true. The first range of 
# numbers are 4, 5, 6, 7, 8, 9, 10 and the second range of numbers 
# are 2, 3, 4, 5, 6. The last element in the array is 3, and there 
# are 3 numbers that overlap between both ranges: 4, 5, and 6. If 
# both ranges do not overlap by at least x numbers, then your 
# program should return the string false. 


puts
puts
puts "***** Overlapping Ranges *****"


# My answer, not totally correct
def OverlappingRanges1(arr)
  return [arr[1] - arr[2], arr[1] - arr[0], arr[3] - arr[0]].max - (arr[2] - arr[0]).abs - (arr[3] - arr[1]).abs + 1 == arr[4]    
end

# My second answer, just a worse version of Jun Park's
def OverlappingRanges(arr)
    return (([arr[1], arr[3]].min - [arr[0], arr[2]].max) + 1) >= arr[4] 
end

# Jun Park's much better answer
def OverlappingRanges2(arr)
  overlapped = ([arr[0], arr[2]].max..[arr[1], arr[3]].min).to_a.length
  overlapped >= arr[4]
end


p arr = [5,11,1,5,1]
p OverlappingRanges1(arr)
p arr = [1,8,2,4,4]
p OverlappingRanges2(arr)
   


####################################################################
# Superincreasing
####################################################################
# Determine if each number in the array is bigger than the sum of
# all elements that came before.

puts
puts
puts "***** Superincreasing *****"

# My first answer
def Superincreasing1(arr)
  cum_sum = arr.each_index.map { |i| arr[0..i].reduce(:+) }
  return (0..arr.length-2).all? { |i| arr[i+1] > cum_sum[i] }     
end
   
# My second much better answer
def Superincreasing2(arr)
  total = 0 
  return arr.all? { |elem| elem > total and total += elem }
end
   
# Jun Park's answer
def Superincreasing3(arr)
  arr.each_with_index{|num, i| return false if arr.slice(0, i).reduce(0, :+) >= num }
  true
end


p arr = [1,2,5,10]
p Superincreasing1(arr)
p Superincreasing2(arr)
p Superincreasing3(arr)
p arr = [1,2,3,4]
p Superincreasing1(arr)
p Superincreasing2(arr)
p Superincreasing3(arr)



####################################################################
# Hamming Distance
####################################################################
# Determine the hamming distance between the two words which is the
# number of characters of the same index that are different.

puts
puts
puts "***** Hamming Distance *****"


# My first, not great answer
def HammingDistance1(strArr)
  ham_dist = 0
  (0..strArr[0].length).each do |i|
    strArr[0][i] != strArr[1][i] ? ham_dist += 1 : 0
  end
 return ham_dist  
end

# My second way better answer
def HammingDistance2(strArr)
  return 0.upto(strArr[0].size-1).count { |i| strArr[0][i] != strArr[1][i] }
end

# Jun Park's answer
def HammingDistance3(strArr)
  count, indices = 0, strArr[0].length
  indices.times{|i| count += 1 if strArr.first[i] != strArr.last[i] }
  count
end

p strArr = ["helloworld", "worldhello"]
p HammingDistance1(strArr)
p HammingDistance2(strArr)
p HammingDistance3(strArr)



####################################################################
# Rectangle Area
####################################################################
# Determine the rectange area given the four corners in arbitrary
# order.

puts
puts
puts "***** Rectangle Area *****"


# My answer
# I got 0/5, but unclear why. When I put in all incorrect cases
# I get correct answer in Aptana. Some unknown error in CoderByte.
def RectangleArea1(strArr)
  strArr.each { |elem| elem.gsub!(/\(|\)/, "") }
  ref_x = strArr[0].split(" ")[0]
  ref_y = strArr[0].split(" ")[1]
  i = 1
  
  until ref_x != (opp_x = strArr[i].split(" ")[0]) && 
        ref_y != (opp_y = strArr[i].split(" ")[1]) do
        i += 1
  end
  
  area = (ref_x.to_i - opp_x.to_i) * 
         (ref_y.to_i - opp_y.to_i)
  
  return area < 0 ? -1*area : area
end
   
# Jun Park answer
def RectangleArea2(strArr)
  grid = strArr.map{|coords| coords.scan(/\d+/).map(&:to_i)}.sort
  area = ((grid[2][0] - grid[0][0]) * (grid[1][1] - grid[0][1])).abs
end


p strArr = ["(1 1)","(1 3)","(3 1)","(3 3)"]
p RectangleArea1(strArr)
p RectangleArea2(strArr)



####################################################################
# Bitwise One
####################################################################
# Calculate the bitwise or of the two binary numbers.

puts
puts
puts "***** Bitwise One *****"

# My first answer
def BitwiseOne1(strArr)
  result_str = ""
  strArr[0].chars.each_index { |i| (strArr[0][i] == "1" or strArr[1][i] == "1") ? result_str += "1" : result_str += "0" }
  return result_str    
end

# My second answer using Jun Park's trick: first, second = strArr
# automatically asigns first to first element and second to second
def BitwiseOne2(strArr)
  result_str = ""
  first, second = strArr
  strArr[0].chars.each_index { |i| (first[i] == "1" or second[i] == "1") ? result_str += "1" : result_str += "0" }
  return result_str    
end

# Jun Park's answer
def BitwiseOne3(strArr)
  result = ""
  first, second = strArr
  0.upto(first.length - 1) {|i| first[i] == "0" && second[i] == "0" ? result += "0" : result += "1" }
  result
end
   

p strArr = ["1001", "0100"] # should return "1101"
p BitwiseOne1(strArr)
p BitwiseOne2(strArr)
p BitwiseOne3(strArr)



####################################################################
# Other Products
####################################################################
# For each element determine the product of all other elements then
# return result with a hyphen.

puts
puts
puts "***** Other Products *****"

# My answer
def OtherProducts1(arr)
  return arr.combination(arr.size - 1).to_a.reverse.map { |elem| elem.reduce(:*) }.join("-")
end

# Jun Park's answer
def OtherProducts2(arr)
  arr.map{|n| arr.reduce(1, &:*) / n }.join("-")
end

p arr = [1, 2, 3, 4, 5] # should return 120-60-40-30-24
p OtherProducts1(arr)
p OtherProducts2(arr)

####################################################################
# Wave Sorting
####################################################################
# Return true if the array is a wave.
# Ex: 0 > 4 < 22 > 4 < 14 > 4 < 2
puts
puts
puts "***** Wave Sorting *****"

# Solving this problem amounts to sorting the array from smallest to largest
# then dividing it in two and checking that each number in the array of larger
# numbers is more than the cooresponding index in the array of smaller numbers.
# [0, 4, 22, 4, 14, 4, 2] becomes [0, 2, 4] and [4, 4, 14, 22]. If any of these
# tests fail then a wave pattern is not possible. Note we don't have to test
# the last number, 22 in the case above, since if the second to last number, 14
# in our example, is larger than it's coorsponding index in the smaller array, 4
# in our example, the last digit is guaranteed to be larger or equal to 14 since
# the array is sorted. If we make it past all of thse test then we should return
# true.


# My answer
def WaveSorting1(arr)
  (0..arr.size/2 - 1).each { |i| return false if arr.sort.slice(arr.size/2, arr.size/2)[i] <= arr.sort.slice(0, arr.size/2)[i] }
  return true
end

# Jun Park's answer
def WaveSorting2(arr)
  arr.each{|num| return false if arr.count(num) > (arr.length / 2.0) }
  true
end

p arr = [0, 4, 22, 4, 14, 4, 2]
p WaveSorting1(arr)
p WaveSorting2(arr)


####################################################################
# Array Matching
####################################################################
#strArr is ["[1, 2, 5, 6]", "[5, 2, 8, 11]"], then both elements in 
#the input represent two integer arrays, and your goal for this 
#challenge is to add the elements in corresponding locations from both 
#arrays. For the example input, your program should do the following 
#additions: [(1 + 5), (2 + 2), (5 + 8), (6 + 11)] which then equals 
#[6, 4, 13, 17]. Your program should finally return this resulting 
#array in a string format with each element separated by a hyphen: 
#6-4-13-17. 

#If the two arrays do not have the same amount of elements, then simply 
#append the remaining elements onto the new array (example shown below). 
#Both arrays will be in the format: [e1, e2, e3, ...] where at least one 
#element will exist in each array. 

puts
puts
puts "***** Array Matching *****"

# My answer
def ArrayMatching1(strArr)
  arr0, arr1, sum_arr = strArr[0].scan(/d+/), strArr[1].scan(/d+/), []
  start, stop = 0, [arr0.size, arr1.size].max - 1
  start.upto(stop) { |i| sum_arr[i] = arr0[i].to_i + arr1[i].to_i }
  return sum_arr.join('-')
end

#Jun Park's Answer
def ArrayMatching2(strArr)
  short, long = strArr.map{|arr| arr.scan(/d+/).map(&:to_i)}.sort{|x, y| x.size <=> y.size }
  result = long.map.with_index{|num, i| i < short.size ? num += short[i] : num }.join("-")
end

p strArr = ["[1, 2, 5, 6]", "[5, 2, 8, 11]"]
p ArrayMatching1(strArr)
p ArrayMatching2(strArr)


####################################################################
# Binary Reversal
####################################################################
# take the str parameter being passed, which will be a positive 
# integer, take its binary representation, reverse that string of 
# bits, and then finally return the new reversed string in decimal 
# form. For example: if str is "47" then the binary version of this 
# integer is 00101111. Your program should reverse this binary string 
# which then becomes: 11110100 and then finally return the decimal 
# version of this string, which is 244. 


puts
puts
puts "***** Binary Reversal *****"


# My first answer
# Note that str.to_i.to_s(2) does not include leading 0's. They
# must be appended manually by finding the closest multiple of 8
# and prefixing remaining digits. That is why the counter is used.
def BinaryReversal1(str)
    str = str.to_i.to_s(2)
    
    counter = str.length
    until counter % 8 == 0
      counter += 1
    end
    
    str = ("0" * (counter - str.length)) + str
    return str.reverse.to_i(2)  
end


# Jun Park did the same thing, but more cleaverly.
# Note that he used an inline "until" loop and went
# up by multiples of 8. Then added digits individually.
# Also reverse teh string straight away and then add the 
# digits.
def BinaryReversal(str, digits= 8)
  binary = str.to_i.to_s(2).reverse
  
  digits += 8 until digits >= binary.length
  binary += "0" until binary.length == digits
  
  binary.to_i(2)
end


p str = "4567" # 60296
p BinaryReversal1(str)
p BinaryReversal2(str)


####################################################################
# Longest Increasing Sequence
####################################################################

# What to use a binary tree, but don't know how to program in Ruby.


####################################################################
# Even Pairs
####################################################################
# Determine if a pair of adjacent even numbers exists anywhere in 
# the string.

puts
puts
puts "***** Even Pairs *****"

# If there are two or more even numbers together then the answer is
# yes. Consider the string "7r5gg812", the answer is yes, because 8
# is even and 12 is even. If needed you could awalys make an even
# number. For example, in the number "237711574771" you could just
# select 2 and 37711574 and say that these are two adjacent even
# numbers. The code below splits up the string into consecutive
# numbers then splits up each resulting number group and counts
# the number of even numbers, returning true if there are two
# or more numbers in the same number group.

def EvenPairs(str)
  even_count_arr = str.scan(/\d+/).map {|e| e.chars.map(&:to_i).count{|n| n.even? }}
  return even_count_arr.max >= 2    
end

# There was no good alternative answer

p str = "f09r27i8e67" # false
p EvenPairs(str)
p str = "7r5gg812"
p EvenPairs(str) # true


####################################################################
# Next Palindrome
####################################################################
# Take the num parameter being passed and return the next largest 
# palindromic number. The input can be any positive integer. For 
# example: if num is 24, then your program should return 33 because 
# that is the next largest number that is a palindrome. 

puts
puts
puts "***** Next Palindrome *****"


def NextPalindrome1(num)
  num += 1
  until num.to_s == num.to_s.reverse
    num += 1 
  end
  return num  
end

# Jun Park implmented things similarly, but with a recursive call.
def NextPalindrome2(num)
  num += 1
  num.to_s == num.to_s.reverse ? num : NextPalindrome2(num)
end

p num = 24 # Answer is 33
p NextPalindrome1(num)
p NextPalindrome2(num)


####################################################################
# Largest Pair
####################################################################
# Take the num parameter being passed and determine the largest 
# double digit number within the whole number. For example: if num 
# is 4759472 then your program should return 94 because that is the 
# largest double digit number. The input will always contain at least 
# two positive digits. 

puts
puts
puts "***** Largest Pair *****"


def LargestPair(num)
  return (num.to_s[0..-1].scan(/\d\d/) + num.to_s[1..-1].scan(/\d\d/)).map!(&:to_i).max    
end

# No good alternative answer

p num = 4759472
p LargestPair(num) #94


####################################################################
# Nonrepeating Character
####################################################################
# Take the str parameter being passed, which will contain only 
# alphabetic characters and spaces, and return the first non-repeating 
# character. For example: if str is "agettkgaeee" then your program 
# should return k. The string will always contain at least one character 
# and there will always be at least one non-repeating character. 

puts
puts
puts "***** Nonrepeating Character *****"


# My answer
def NonrepeatingCharacter1(str)
  chars = str.chars.uniq
  index = chars.map { |c| str.count(c) }.index(1)
  return chars[index]     
end


# Jun Park's creative answer. I like this one!
def NonrepeatingCharacter2(str)
  str.chars.keep_if{|char| str.count(char) == 1}.first
end


p str = "agettkgaeee" 
p NonrepeatingCharacter1(str)
p NonrepeatingCharacter2(str)


####################################################################
# Two Sum
####################################################################
# Take the array of integers stored in arr, and determine if any 
# two numbers (excluding the first element) in the array can sum up to 
# the first element in the array. For example: if arr is 
# [7, 3, 5, 2, -4, 8, 11], then there are actually two pairs that sum 
# to the number 7: [5, 2] and [-4, 11]. Your program should return all 
# pairs, with the numbers separated by a comma, in the order the first 
# number appears in the array. Pairs should be separated by a space. 
# So for the example above, your program would return: 5,2 -4,11. 

puts
puts
puts "***** Two Sum *****"


# My answer
def TwoSum1(arr)
  target = arr.shift
  two_sums = arr.combination(2).to_a.select { |a| a.reduce(&:+) == target }
  result = two_sums.map { |e| e.join(',') }.join(" ")
  return result.length > 0 ? result : -1
end


# June Park's answer
def TwoSum2(arr)
  first, pairs, result = arr.shift, arr.combination(2).to_a, []
  pairs.each{|pair| result << pair.join(",") if pair.reduce(:+) == first }
  
  result.empty? ? -1 : result.join(" ")
end
   
p arr = [7, 3, 5, 2, -4, 8, 11]
p TwoSum1(arr)
p TwoSum2(arr)



####################################################################
# Bitwise Two
####################################################################
# take the array of strings stored in strArr, which will only contain 
# two strings of equal length that represent binary numbers, and return 
# a final binary string that performed the bitwise AND operation on both 
# strings. A bitwise AND operation places a 1 in the new string where 
# there is a 1 in both locations in the binary strings, otherwise it 
# places a 0 in that spot. For example: if strArr is ["10111", "01101"] 
# then your program should return the string "00101" 

puts
puts
puts "***** Bitwise Two*****"

# My answer. Jun Park's answer is very similar.
def BitwiseTwo(strArr)
    first, second = strArr; result = ""
    0.upto(first.length-1) { |i| (first[i] == '1' and second[i] == '1') ? result += '1' : result += '0'}
    return result      
end

p strArr = ["10111", "01101"]
p BitwiseTwo(strArr)


####################################################################
# Power Set Count
####################################################################
# Take the array of integers stored in arr, and return the length of 
# the power set (the number of all possible sets) that can be generated. 
# For example: if arr is [1, 2, 3], then the following sets form the 
# power set: 
# [] 
# [1]
# [2]
# [3]
# [1, 2]
# [1, 3]
# [2, 3]
# [1, 2, 3] 
# For this input, your program should return 8. 

puts
puts
puts "***** Power Set Count *****"

# My first anwser
def PowerSetCount1(arr)
    return (0..arr.size).flat_map { |i| arr.combination(i).to_a }.size    
end

# If you want to be clever you could use this method,
# my second answer:
def PowerSetCount2(arr)
    return 2**arr.length
end

# Other users answer are worse than mine

p arr = [1, 2, 3]
p PowerSetCount1(arr)
p PowerSetCount2(arr)


####################################################################
# Product Digits
####################################################################
# Take the num parameter being passed which will be a positive integer, 
# and determine the least amount of digits you need to multiply to produce
# it. For example: if num is 24 then you can multiply 8 by 3 which 
# produces 24, so your program should return 2 because there is a total 
# 3 of only 2 digits that are needed. Another example: if num is 90, you 
# can multiply 10 * 9, so in this case your program should output 3 
# because you cannot reach 90 without using a total of 3 digits in 
# your multiplication.


puts
puts
puts "***** Product Digits *****"

# My first answer
# Somewhat inefficient because you have to go through and collect
# all of the factors and then loop through again to pick out the
# shortest. You could keep track of the minimum as you go. 
def ProductDigits1(num1)
  num2, results = 1, []
  until num2 == num1
    results << [num2.to_s, (num1/num2).to_s] if num1 % num2 == 0
    num2 += 1
  end
  return results.map! { |e| e.map { |k| k.length }.reduce(&:+) }.min
end


# My second answer
# Here we loop through and keep track of the minimum as we go.
# However we have to check the following condition each loop:
# (num1.to_s + num2.to_s).length < min
# Really we only need to check that if the first condition
# is met: (num1 % num2 == 0), otherwise num2 isn't a factor ,
# and so it doesn't matter what it's length is.
def ProductDigits2(num1)
  num2, min = 1, num1.to_s.length + 1
  until num2 == num1
    min = (num1.to_s + num2.to_s).length if (num1 % num2 == 0) && ((num1.to_s + num2.to_s).length < min)
    num2 += 1
  end
  return min
end

# My third answer
# This answer only checks the length if we know num2 is a 
# factor of num1. Also it defines this_length so it doesn't
# calculate (num1.to_s + num2.to_s).length twice as in the
# previous example which calculates it once for the if 
# condition and potentially again in the assignment step.
def ProductDigits3(num1)
  num2, min = 1, num1.to_s.length + 1
  until num2 == num1
    if (num1 % num2 == 0)
      this_length = (num1.to_s + num2.to_s).length 
      if(this_length < min) 
        min = this_length
      end
    end
    num2 += 1
  end
  return min
end

# My fourth answer
# This uses the memo technique, but is probably less efficient
# than Answer 3 because of the reasons discussed above.
def ProductDigits4(num1)
  min = (1..num1).inject(num1.to_s.length + 1) { |min, num2|
     (num1 % num2 == 0) && ((num1.to_s + num2.to_s).length < min) ? (num1.to_s + num2.to_s).length : min }
  return min
end

p num1 = 90 # 3
p ProductDigits1(num1)
p ProductDigits2(num1)
p ProductDigits3(num1)
p ProductDigits4(num1)


p num1 = 1 # 2
p ProductDigits1(num1)
p ProductDigits2(num1)
p ProductDigits3(num1)
p ProductDigits4(num1)


####################################################################
# Palindrome Creator
####################################################################
# take the str parameter being passed and determine if it is possible 
# to create a palindromic string of at least 3 characters by removing 
# 1 or 2 characters. For example: if str is "abjchba" then you can 
# remove the characters jc to produce "abhba" which is a palindrome. 
# For this example your program should return the two characters that 
# were removed with no delimiter and in the order they appear in the 
# string, so jc. If 1 or 2 characters cannot be removed to produce a 
# palindrome, then return the string not possible. If the input string 
# is already a palindrome, your program should return the string 
# palindrome. 
#
# The input will only contain lowercase alphabetic characters. Your 
# program should always attempt to create the longest palindromic 
# substring by removing 1 or 2 characters (see second sample test 
# case as an example). The 2 characters you remove do not have 
# to be adjacent in the string. 


puts
puts
puts "***** Palindrome Creator *****"

# My first answer
# This is inefficient since you loop through
# many times. First to get string combinations
# then to get words with strings removed
# then to select the longest palindrome.
# Obviously a more efficient way would be to do 
# a double loop and keep track of things as you go.
def PalindromeCreator1(str)
  return "palindrome" if str == str.reverse
  letters = str.chars.uniq.combination(1).to_a + str.chars.uniq.combination(2).to_a
  potential_pals = letters.map { |e| str.tr(e.join(''),'') }
  result = potential_pals.select { |e| e.length >= 3 and e == e.reverse }.max_by(&:length) # .max gives last string in array not longest
  return result.nil? ? "not possible" : (str.chars - result.chars).join('')
end

# Jun Park's answer. More efficient. But
# had trouble understanding.
def PalindromeCreator2(str)
  return "palindrome" if palindrome?(str)
  result = nil
  
  str.chars.each_index do |i|
    break if str.length <= 3
    first = str.chars.clone
    single = first.slice!(i)
    result = single if palindrome?(first) && (result == nil || single.length < result.length)
    
    first.each_index do |i2|
      break if first.length <= 3 
      second = first.clone 
      double = single + second.slice!(i2)
      result = double if palindrome?(second) && (result == nil || double.length < result.length)
    end
  end
  
  result.nil? ? "not possible" : result

def palindrome?(word)
  word == word.reverse
end


p str = "abjchba"
p PalindromeCreator1(str)
p PalindromeCreator2(str)




####################################################################
# Roman Numerials
####################################################################


# I for 1, V for 5, X for 10, L for 50, C for 100, D for 500 and M for 1000.


str = "XXIV" # 24
# 10, 50 = 40 + 5 + 1

numerials = { "I" => 1, "V" => 5, "X" => 10, "L" => 50, "C" => 100, "D" => 500, "M" => 1000}
p str.chars.inject(0) { |m,e| m < numerials[e] ? m = numerials[e] - m :  m += numerials[e] }



####################################################################
# Food Distribution
####################################################################
# read the array of numbers stored in arr which will represent the 
# hunger level of different people ranging from 0 to 5 (0 meaning not 
# hungry at all, 5 meaning very hungry). You will also have N sandwiches 
# to give out which will range from 1 to 20. The format of the array will 
# be [N, h1, h2, h3, ...] where N represents the number of sandwiches you 
# have and the rest of the array will represent the hunger levels of 
# different people. Your goal is to minimize the hunger difference between 
# each pair of people in the array using the sandwiches you have available. 

# For example: if arr is [5, 3, 1, 2, 1], this means you have 5 
# sandwiches to give out. You can distribute them in the following order 
# to the people: 2, 0, 1, 0. Giving these sandwiches to the people their 
# hunger levels now become: [1, 1, 1, 1]. The difference between each pair 
# of people is now 0, the total is also 0, so your program should return 0. 
# Note: You may not have to give out all, or even any, of your sandwiches 
# to produce a minimized difference. 

# Another example: if arr is [4, 5, 2, 3, 1, 0] then you can distribute 
# the sandwiches in the following order: [3, 0, 1, 0, 0] which makes all 
# the hunger levels the following: [2, 2, 2, 1, 0]. The differences between 
# each pair of people is now: 0, 0, 1, 1 and so your program should return 
# the final minimized difference of 2. 

puts
puts
puts "***** Food Distribution *****"


# My first answer is 3/5
def FoodDistribution(arr)
    sandwiches = arr.shift
    until (sandwiches == 0) || (arr.uniq.length == 1)
      hungry_person = 0.upto(arr.length-2).max_by { |i| arr[i] - arr[i+1] }
      sandwiches -= 1; arr[hungry_person] -= 1 
    end
    return 0.upto(arr.length-2).inject(0) { |sum, i| sum += (arr[i] - arr[i+1]) }
end


# My second answer is 4/5, but failed on several including this:
# arr = [1, 5, 4, 1]
sandwiches = arr.shift
until (sandwiches == 0) || (arr.uniq.length == 1)
  p arr
  min, max = 0.upto(arr.length-2).minmax_by { |i| arr[i] - arr[i+1] }
  p min; p max
  sandwiches -= 1
  (arr[min+1] - arr[min]) > (arr[max] - arr[max+1]) ? arr[min+1] -= 1 : arr[max] -= 1
end
p arr
p 0.upto(arr.length-2).inject(0) { |sum, i| sum += (arr[i] - arr[i+1]).abs }




####################################################################
# Three Sum
####################################################################
# Take the array of integers stored in arr, and determine if any 
# three distinct numbers (excluding the first element) in the array 
# can sum up to the first element in the array. For example: if arr 
# is [8, 2, 1, 4, 10, 5, -1, -1] then there are actually three sets 
# of triplets that sum to the number 8: [2, 1, 5], [4, 5, -1] and 
# [10, -1, -1]. Your program should return the string true if 3 
# distinct elements sum to the first element, otherwise your 
# program should return the string false. The input array will 
# always contain at least 4 elements. 


puts
puts
puts "***** Three Sum *****"

# My first answer
def ThreeSum1(arr)
  first_val = arr.shift
  summed_arr = arr.combination(3).to_a.map { |elem| elem.reduce(&:+) }
  return summed_arr.any? { |elem| elem == first_val }   
end

# Jun Park's answer
# A bit more efficient since you only reduce up until the first
# match.
def ThreeSum2(arr)
  number = arr.shift
  arr.combination(3).to_a.each{|triplets| return true if number == triplets.reduce(0, :+)}
  false
end


p arr = [64, 3, 50, 45, 32, 14, 50, 45, 31, 66, 22, 15, 16, 20] # true
p ThreeSum1(arr)
p ThreeSum2(arr)



####################################################################
# Correct Path
####################################################################
# Read the str parameter being passed, which will represent the 
# movements made in a 5x5 grid of cells starting from the top left 
# position. The characters in the input string will be entirely 
# composed of: r, l, u, d, ?. Each of the characters stand for the 
# direction to take within the grid, for example: r = right, l = left, 
# u = up, d = down. Your goal is to determine what characters the 
# question marks should be in order for a path to be created to go from 
# the top left of the grid all the way to the bottom right without 
# touching previously travelled on cells in the grid. 

# For example: if str is "r?d?drdd" then your program should output the 
# final correct string that will allow a path to be formed from the top 
# left of a 5x5 grid to the bottom right. For this input, your program 
# should therefore return the string rrdrdrdd. There will only ever be 
# one correct path and there will always be at least one question mark 
# within the input string. 



### TBD ###



####################################################################
# Scale Balancing
####################################################################
# Read strArr which will contain two elements, the first being the 
# two positive integer weights on a balance scale (left and right sides) 
# and the second element being a list of available weights as positive 
# integers. Your goal is to determine if you can balance the scale by 
# using the least amount of weights from the list, but using at most 
# only 2 weights. For example: if strArr is ["[5, 9]", "[1, 2, 6, 7]"] 
# then this means there is a balance scale with a weight of 5 on the 
# left side and 9 on the right side. It is in fact possible to balance 
# this scale by adding a 6 to the left side from the list of weights 
# and adding a 2 to the right side. Both scales will now equal 11 and 
# they are perfectly balanced. Your program should return a common 
# separated string of the weights that were used from the list in 
# ascending order, so for this example your program should return the 
# string 2,6 

# There will only ever be one unique solution and the list of 
# available weights will not be empty. It is also possible to add two 
# weights to only one side of the scale to balance it. If it is not 
# possible to balance the scale then your program should return the 
# string not possible. 


puts
puts
puts "***** Scale Balancing *****"


# My first terrible, terrible answer
# Got the following test case wrong: ["[6, 2]", "[1, 10, 6, 5]"]
def ScaleBalancing1(strArr)
  scale, weights = strArr[0].scan(/d+/).map(&:to_i), strArr[1].scan(/d+/).map(&:to_i).uniq
  result = weights.select { |e| scale.min + e == scale.max }
  return result[0].to_s if result.size > 0
  weights = weights.combination(2).to_a
  result = weights.select { |e| scale.min + e.max == scale.max + e.min }
  return result.flatten.join(",") if result.size > 0
  result = weights.select { |e| scale.min + e.reduce(&:+) == scale.max }
  result.size > 0 ? result.flatten.join(",") : "not possible"  
end   


# My second answer is better. It's easier to read and more efficient.
# For example, we conly calculate the combinations of 2 weights if we
# need to (if a single weight won't do the trick.) You could be even
# more efficient with a loop since you could only make necessry
# calcualtions right before the check and then return. For example,
# calcualting sum of two weights one at a time and checking if they
# work rather than as a chunk like I did.
def ScaleBalancing2(strArr)
  scale, weights = strArr[0].scan(/\d+/).map(&:to_i), strArr[1].scan(/\d+/).map(&:to_i)
  diff = scale.max - scale.min
  weights.each { |w| return w if w == diff } # could do return diff.to_s if weights.include?(diff)
  weight_combos = weights.combination(2).to_a
  weight_combos.map { |w| return w.join(",") if w.reduce(&:+) == diff }
  weight_combos.map { |w| return w.join(",") if (w.max - w.min) == diff }
  return "not possible"
end 


# Emuchynski's answer. I like it!
def ScaleBalancing3(strArr)

  scale = JSON.parse(strArr[0])
  weights = JSON.parse(strArr[1])
  diff = (scale[0] - scale[1]).abs
  
  return diff.to_s if weights.include?(diff)
  
  (0..weights.length-1).each do |i|
    (i+1..weights.length-1).each do |j|
      if weights[i] + weights[j] == diff or (weights[i] - weights[j]).abs == diff
        return weights[i].to_s + "," + weights[j].to_s
      end
    end
  end
  return 'not possible'       
end
   

p strArr = ["[6, 2]", "[1, 10, 6, 5]"]
p ScaleBalancing1(strArr)
p ScaleBalancing2(strArr)
p ScaleBalancing3(strArr)



####################################################################
# Three Numbers
####################################################################
# Take the str parameter being passed and determine if exactly three
# unique, single-digit integers occur within each word in the string.
# The integers can appear anywhere in the word, but they cannot be
# all adjacent to each other. If every word contains exactly 3 unique 
# integers somewhere within it, then return the string true, otherwise 
# return the string false. For example: if str is "2hell6o3 wor6l7d2" 
# then your program should return "true" but if the string is 
# "hell268o w6or2l4d" then your program should return "false" because 
# all the integers are adjacent to each other in the first word.


puts
puts
puts "***** Three Numbers *****"

# My first answer
def ThreeNumbers(str)
    words = str.split(" ")
    return false if words.any? { |e| e =~ /\d{3}/ } # returns index of three digits
    nums = words.map { |e| e.gsub(/\D/,"").chars.uniq.join("") } # remove everything not a digit
    return nums.all? { |e| e.length == 3 } # make srue there are exactly 3 numbers in each word
end


# No other good user answers


p str = "hell268o w6or2l4d" # false
p ThreeNumbers(str) 
p str = "2hell6o3 wor6l7d2" # true
p ThreeNumbers(str)



####################################################################
# Alphabet Searching 
####################################################################
# Take the str parameter being passed and return the string true if 
# every single letter of the English alphabet exists in the string, 
# otherwise return the string false. For example: if str is 
# "zacxyjbbkfgtbhdaielqrm45pnsowtuv" then your program should return 
# the string true because every character in the alphabet exists in 
# this string even though some characters appear more than once.


puts
puts
puts "***** Alphabet Searching *****"


def AlphabetSearching(str)
    return ([*('a'..'z')] - str.gsub(/[^a-z]/,"").chars.uniq).length == 0
end


# No other good user answers


p str="zacxyjbbkfgtbhdaielqrm45pnsowtuv" 
p AlphabetSearching(str)



####################################################################
# Time Difference
####################################################################


# TBD



####################################################################
# Triangle Row
####################################################################
# Take num which will be a positive integer representing some row 
# from Pascal's triangle. Pascal's triangle starts with a [1] at the 
# 0th row of the triangle. Then the first row is [1, 1] and the second 
# row is [1, 2, 1]. The next row begins with 1 and ends with 1, and the 
# inside of the row is determined by adding the k-1 and kth elements 
# from the previous row. The next row in the triangle would then be 
# [1, 3, 3, 1], and so on. The input will be some positive integer 
# and your goal is to return the sum of that row. For example: if 
# num is 4 then your program should return the sum of 
# 1 + 4 + 6 + 4 + 1 which is 16. 


puts
puts
puts "***** Triangle Row *****"

# My first answer
# Uses a clever shortcut
def TriangleRow1(num)
    return 2**num
end
   

# My second answer using recursion. This actually calculates
# the nth row rather than the sum, but since this is practice
# I didn't worry about it. It's easy enough to calculate
# the sum once you have the row.
def TriangleRow2(row_num, counter=1, pas_row=[0, 1, 0])
  
  arr = []
  (1..counter).each do |i|
    arr << pas_row[i-1] + pas_row[i]
  end
  
  return (arr) if row_num == counter
  return TriangleRow(row_num, counter + 1, pas_row=([0] + arr + [0]))

end

# My third answer using recursion and each_with_object
# the nth row rather than the sum, but since this is practice
# I didn't worry about it. It's easy enough to calculate
# the sum once you have the row.
def TriangleRow3(row_num, counter=1, pas_row=[0, 1, 0])
  pas_row = (1..counter).each_with_object([]) { |i, arr| arr << pas_row[i-1] + pas_row[i] }
  return pas_row if row_num == counter
  return TriangleRow(row_num, counter + 1, pas_row=([0] + pas_row + [0]))
end


p num = 7
p TriangleRow1(num)
p TriangleRow2(num)
p TriangleRow3(num)



####################################################################
# Vowel Square
####################################################################
# Take the strArr parameter being passed which will be a 2D matrix of 
# some arbitrary size filled with letters from the alphabet, and determine 
# if a 2x2 square composed entirely of vowels exists in the matrix. For 
# example: strArr is ["abcd", "eikr", "oufj"] then this matrix looks 
# like the following: 

# a b c d
# e i k r
# o u f j 

# Within this matrix there is a 2x2 square of vowels starting in the 
# second row and first column, namely, ei, ou. If a 2x2 square of vowels 
# is found your program should return the top-left position (row-column) 
# of the square, so for this example your program should return 1-0. If no 
# 2x2 square of vowels exists, then return the string not found. If there 
# are multiple squares of vowels, return the one that is at the most 
# top-left position in the whole matrix. The input matrix will at least 
# be of size 2x2. 


arr = ["aqrst", "ukaei", "ffooo"]
p arr.each_with_object([]) { |row, outer_arr| outer_arr << 0.upto(row.length).each_with_object([]) { |i, inner_array| inner_array << i if row[i] =~ /[aeiou]/ }}


####################################################################
# Closest Enemy
####################################################################
# Take the array of numbers stored in arr and from the position in the 
# array where a 1 is, return the number of spaces either left or right 
# you must move to reach an enemy which is represented by a 2. For 
# example: if arr is [0, 0, 1, 0, 0, 2, 0, 2] then your program should 
# return 3 because the closest enemy (2) is 3 spaces away from the 1. 
# The array will contain any number of 0's and 2's, but only a single 1. 
# It may not contain any 2's at all as well, where in that case your 
# program should return a 0. 


puts
puts
puts "***** Closest Enemy *****"

# My answer
def ClosestEnemy(arr)
  arr.include?(2) ? 0.upto(arr.length-1).each_with_object([]) { |i,a| a << (arr.find_index(1) - i).abs if arr[i] == 2 }.min : 0
end


p arr = [0, 0, 1, 0, 0, 2, 0, 2] # 3
p ClosestEnemy(arr)
p arr = [0, 1, 0] # 0
p ClosestEnemy(arr)



####################################################################
# Closest Enemy II
####################################################################
# Using the Ruby language, have the function ClosestEnemyII(strArr) 
# read the matrix of numbers stored in strArr which will be a 2D matrix 
# that contains only the integers 1, 0, or 2. Then from the position in 
# the matrix where a 1 is, return the number of spaces either left, right, 
# down, or up you must move to reach an enemy which is represented by a 2. 
# You are able to wrap around one side of the matrix to the other as well. 
# For example: if strArr is ["0000", "1000", "0002", "0002"] then this looks 
# like the following: 

# 0 0 0 0
# 1 0 0 0
# 0 0 0 2
# 0 0 0 2 

# For this input your program should return 2 because the closest enemy (2) 
# is 2 spaces away from the 1 by moving left to wrap to the other side and 
# then moving down once. The array will contain any number of 0's and 2's, but 
# only a single 1. It may not contain any 2's at all as well, where in that case 
# your program should return a 0. 


puts
puts
puts "***** Closest Enemy II *****"


# My answer. There is probably a better way. I should come back to this
def ClosestEnemyII(strArr)
    ones, twos = [], []
    
    # Get index of all the 1s and 2s
    strArr.each_with_index do |row, row_num| 
      row.chars.each_with_index do |char, col_num|
        ones << [row_num, col_num] if char == "1"
        twos << [row_num, col_num] if char == "2"
      end
    end

    There may not be any 2s
    return 0 if twos.size == 0
    
    # Calculate the total rows and columns you have to move
    # from the 1 to each 2
    distance = twos.each_with_object([]) do |elem, a|
      min_row_distance = (ones[0][0] - elem[0]).abs
      # If distance is too long you can wrap around:
      min_row_distance = (min_row_distance > strArr.size/2) ? strArr.length - min_row_distance : min_row_distance
      min_col_distance  = (ones[0][1] - elem[1]).abs
      # If distance is too long you can wrap around:
      min_col_distance = (min_col_distance > strArr.size/2) ? strArr.length - min_col_distance : min_col_distance
      # Add each distance to the array
      a << min_row_distance + min_col_distance
    end
    
    # Return the minimum total distance.
    return distance.min
end


p strArr = ["00000", "10000", "00000", "00002", "02002"] 
p ClosestEnemyII(strArr)

####################################################################
# Largest Four
####################################################################
# Take the array of integers stored in arr, and find the four largest 
# elements and return their sum. For example: if arr is 
# [4, 5, -2, 3, 1, 2, 6, 6] then the four largest elements in this array 
# are 6, 6, 4, and 5 and the total sum of these numbers is 21, so your 
# program should return 21. If there are less than four numbers in the 
# array your program should return the sum of all the numbers in the array. 


puts
puts
puts "***** Largest Four *****"

# My answer
def LargestFour(arr)
    return arr.length < 4 ? arr.reduce(&:+) : arr.sort[-4..-1].reduce(&:+)    
end

p arr = [4, 5, -2, 3, 1, 2, 6, 6]
p LargestFour(arr)


####################################################################
# Distinct Characters
####################################################################
# Take the str parameter being passed and determine if it contains at 
# least 10 distinct characters, if so, then your program should return 
# the string true, otherwise it should return the string false. For 
# example: if str is "abc123kkmmmm?" then your program should return 
# the string false because this string contains only 9 distinct 
# characters: a, b, c, 1, 2, 3, k, m, ? adds up to 9. 


puts
puts
puts "***** Distinct Characters *****"


def DistinctCharacters(str)
    return str.chars.uniq.size >= 10 
end

p "abc123kkmmmm?"
p DistinctCharacters(str)



####################################################################
# Question Marks
####################################################################
# Take the str string parameter, which will contain single digit 
# numbers, letters, and question marks, and check if there are exactly 
# 3 question marks between every pair of two numbers that add up to 10. 
# If so, then your program should return the string true, otherwise it 
# should return the string false. If there aren't any two numbers that 
# add up to 10 in the string, then your program should return false as 
# well. 

# For example: if str is "arrb6???4xxbl5???eee5" then your program 
# should return true because there are exactly 3 question marks between 
# 6 and 4, and 3 question marks between 5 and 5 at the end of the string. 


puts
puts
puts "***** Question Marks *****"


# My first answer. Sometmies fails.
def QuestionsMarks(str)
    sliced_str = str.slice(/(?[a-z]*?[a-z]*?)/)
    return false if sliced_str.nil?
    reduced_str = (str.chars - sliced_str.chars).join('')
    return reduced_str.scan(/d{2}/).any? { |e| e[0].to_i + e[1].to_i == 10 } 
end


# Need to get better at regexp to use method I want




####################################################################
# Camel Case
####################################################################
# Have the function CamelCase(str) take the str parameter being 
# passed and return it in proper camel case format where the first 
# letter of each word is capitalized (excluding the first letter). 
# The string will only contain letters and some combination of 
# delimiter punctuation characters separating each word. 

# For example: if str is "BOB loves-coding" then your program should 
# return the string bobLovesCoding. 


puts
puts
puts "***** Camel Case *****"

# My answer
# Note that words[0] returns a string version of the first
# word, but words[0..0] returns an array containing only
# the first word. Need the array so that '+' works and the
# two data types can be joined.
def CamelCase(str)
    words = str.scan(/\w+/).map(&:downcase)
    return (words[0..0] + words[1..-1].map(&:capitalize)).join("")     
end


p str = "BOB loves-coding"
p CamelCase(str)



####################################################################
# ASCII Conversion
####################################################################
# Take the str parameter being passed and return a new string where 
# every character, aside from the space character, is replaced with its 
# corresponding decimal character code. For example: if str is "dog" 
# then your program should return the string 100111103 because 
# d = 100, o = 111, g = 103.


puts
puts
puts "***** ASCII Conversion *****"

# My answer
# Notice the use of each_byte to do most of the work.
def ASCIIConversion1(str)
    to_bytes = str.split(" ").each_with_object([]) do |word, a| 
      ascii = ""
      word.each_byte do |byte| 
        ascii += byte.to_s
      end
      a << ascii
    end
    
    return to_bytes.join(" ")
end


# Here is emuchynask's answer using .ord instead of each_byte
def ASCIIConversion2(str)

  new_str = ""
  
  (0..str.length-1).each do |i|
    if str[i] != ' '
        new_str += str[i].ord.to_s
    else
        new_str += ' '
    end
  end
  new_str
         
end
   
p str = "hello world" # "104101108108111 119111114108100"
p ASCIIConversion1(str)
p ASCIIConversion2(str)


####################################################################
# Simple Evens
####################################################################
# Check whether every single number in the passed in parameter is even. 
# If so, return the string true, otherwise return the string false. 
# For example: if num is 4602225 your program should return the string 
# false because 5 is not an even number. 


puts
puts
puts "***** Simple Evens *****"


# My first answer
def SimpleEvens1(num)
    return num.to_s.chars.all? { |n| n.to_i.even? }  
end

# My second alternative answer
def SimpleEvens2(num)
    num.to_s.chars.each { |n| return false if n.to_i % 2 != 0 }
    return true
end

p num = 4602225 # false
p SimpleEvens1(num)
p SimpleEvens2(num)


p num = 42428842044 # true
p SimpleEvens1(num)
p SimpleEvens2(num)



####################################################################
# Snake Case
####################################################################
# Take the str parameter being passed and return it in proper snake 
# case format where each word is lowercased and separated from adjacent 
# words via an underscore. The string will only contain letters and 
# some combination of delimiter punctuation characters separating 
# each word. 

# For example: if str is "BOB loves-coding" then your program should 
# return the string bob_loves_coding. 


puts
puts
puts "***** Snake Case *****"

# My answer
def SnakeCase(str)
    return str.downcase.scan(/\w+/).join("_")    
end


p str = "cats AND*Dogs-are Awesome"
p SnakeCase(str)


####################################################################
# Sum Multiplier
####################################################################
# Take the array of numbers stored in arr and return the string true 
# if any two numbers can be multiplied so that the answer is greater 
# than double the sum of all the elements in the array. If not, 
# return the string false. For example: if arr is 
# [2, 5, 6, -6, 16, 2, 3, 6, 5, 3] then the sum of all these elements 
# is 42 and doubling it is 84. There are two elements in the array, 
# 16 * 6 = 96 and 96 is greater than 84, so your program should return 
# the string true. 


puts
puts
puts "***** Sum Multiplier *****"


# My answer
def SumMultiplier(arr)
    arr_sum = 2*arr.reduce(&:+)
    return arr.combination(2).to_a.any? { |s| s.reduce(&:*) > arr_sum}    
end

p arr = [2, 5, 6, -6, 16, 2, 3, 6, 5, 3] # true
p SumMultiplier(arr)



####################################################################
# String Merge
####################################################################
# Read the str parameter being passed which will contain a large 
# string of alphanumeric characters with a single asterisk character 
# splitting the string evenly into two separate strings. Your goal is 
# to return a new string by pairing up the characters in the corresponding 
# locations in both strings. For example: if str is "abc1*kyoo" then your 
# program should return the string akbyco1o because a pairs with k, b 
# pairs with y, etc. The string will always split evenly with the asterisk 
# in the center.


puts
puts
puts "***** String Merge *****"

# My answer
# Great answer at http://stackoverflow.com/questions/19064209/how-is-each-with-object-supposed-to-work
# about how each_with_object works. Note that w += first[i] + second[i] 
# does not work because += returns a new object and the original object w
# is then returned as "". However << modifies the original object which
# is what we want.
def StringMerge(str)
    first, second = str.split("*")
    return 0.upto(first.length - 1).each_with_object("") { |i, w| w << first[i] + second[i] } 
end
   
p str = "abc1*kyoo" 
p StringMerge(str)



####################################################################
# One Decremented
####################################################################
# Count how many times a digit appears that is exactly one less than 
# the previous digit. For example: if num is 5655984 then your program 
# should return 2 because 5 appears directly after 6 and 8 appears 
# directly after 9.

puts
puts
puts "***** One Decremented *****"


# My answer
def OneDecremented(num)
    str_num = num.to_s
    return 1.upto(str_num.length-1).inject(0) { |sum, i| (str_num[i].to_i + 1) == str_num[i-1].to_i ? sum += 1 : sum }
end
   

p num = 5655984
p OneDecremented(num)




####################################################################
# Element Merger
####################################################################
# Take the array of positive integers stored in arr and perform the 
# following algorithm: continuously get the difference of adjacent 
# integers to create a new array of integers, then do the same for 
# the new array until a single number is left and return that 
# number. For example: if arr is [4, 5, 1, 2, 7] then taking the 
# difference of each pair of elements produces the following new 
# array: [1, 4, 1, 5]. Then do the same for this new array to 
# produce [3, 3, 4] -> [0, 1] -> 1. So for this example your 
# program should return the number 1 because that is what's 
# left at the end. 


puts
puts
puts "***** Element Merger *****"

# My first answer using recursion
# Verifed as 5/5 on coderbyte
def ElementMerger1(arr)
  return arr.shift if arr.size == 1
  merged = 1.upto(arr.size-1).each_with_object([]) { |i, a| a << (arr[i] - arr [i-1]).abs }
  return ElementMerger(merged)
end

# My second answer using until loop
# Verifed as 5/5 on coderbyte
def ElementMerger2(arr)
    until arr.size == 1
     arr = 1.upto(arr.size-1).each_with_object([]) { |i, a| a << (arr[i] - arr [i-1]).abs }
    end
    return arr.shift    
end


p arr = [5, 7, 16, 1, 2] # 7
p ElementMerger1(arr)
p ElementMerger2(arr)



####################################################################
# GCF
####################################################################
# take the array of numbers stored in arr which will always contain 
# only two positive integers, and return the greatest common factor of 
# them. For example: if arr is [45, 12] then your program should return 
# 3. There will always be two elements in the array and they will be 
# positive integers. 


puts
puts
puts "***** Food Distribution *****"

# My answer
def GCF(arr)
    return 1.upto(arr.min).select { |i| (arr.max % i == 0) && (arr.min % i == 0) }.max   
end

p arr = [12, 28] 
p GCF(arr)


