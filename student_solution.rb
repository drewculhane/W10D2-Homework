
# Print Hellow World to the console. 

p "Hello World"

adjective = "Big Bad"

# Interpolate the adjective: 

p "Hello #{adjective} World"

# Save Hello World to a variable and make the whole thing uppercase 

hw= "Hello World" 

 hw.upcase! 
 p hw 

# Nums Arrays and enumerables 
nums = [5, 5, 6, 7, 2, 4, 3, 2, 1, 9, 7, 6, 0, 0, 35, 19, 66, 3, 22, 21, 4, 4, 4, 0, 1, 2, 3, 4, 12, 15]

# unique 
p nums.uniq 
# Prints arrray with all duplicate entries removed. 


# .push 
# Puts a value at the end of the array. 
nums.push(5)
p nums

# .pop 
# Removes a value at the end of the array. 
nums.pop
p nums  

# .shift 
# Removes the first element from the array and returns it. 
nums.shift
p nums.shift 
p nums 

# .unshift 
# Returns the shifted array with argumented element in place. 
p nums.unshift(5)

# .length 
# returns the length of the array/string. 
p "The Length of num is #{nums.length} "  


# .include? 
# Boolean that tests if an array/string includes something. 
p nums.include?(8)
# false 

# .find_all  
# Finds all elements that satisfy the conditions. 
p nums.find_all {|x| x > 10}

# .all? 
# Boolean that tests if all elements satisfy the condition. 
p nums.all? {|x| x > 0 } # ( should evalue false)
p nums.all? { |x| x >= 0 } # (should evaluate true)

# .any? 
# Boolean that tests if any elements satisfy the condition. 
p nums.any? { |x| x % 8 == 0 && x != 0  } # (should evaluate false. remember there are 0s, and 0/8 is equal to 0 with no remainder to.) 
p nums.any? { |x| x % 7 == 0 && x != 0  } # (should evaluate true)

# .count 
# Counts how many elements meet the conditions. 
p nums.count { |x| x > 4 }

# .each_with_index 
p nums.each_with_index { |item, index| p item*index } 

# .find 
# finds the element that satisfies the condition: 
# Is divisible by 5 and 7 and greater than 0. 
p nums.find { |x| x % 7 == 0 && x % 5 == 0 && x > 0 }
thirty_five = nums.find { |x| x % 7 == 0 && x % 5 == 0 && x > 0 }

# .find_index 
# Finds the index of element that satisfies the condition. 
# from previous method: value stored in thirty_five. 
p nums.find_index(thirty_five)

# .first 
# Returns first value, or value(s) based on the parameter it takes in. 
p nums.first(3)

# .last 
# Same concept as first, but counts backwards from end with param, 
# maintaining forward order. 
p nums.last(5) 


# .group_by 
# Returns hashes based on the evaluation of the condition. 

# Modulo, (strict) (true or  false hashes) 
p nums.group_by { |x| x % 3 == 0 }

# Modulo, remainders as hash keys 
p nums.group_by { |x| x % 3 }

# minmax 
# Returns the smallest and largest number in a collection. 
p nums.minmax 

# .reject 
# Returns values that do not fit the given condition. 
# remember 0 case... 0 will eval to % == 0, but it isnt truly a multiple of 3. 
p nums 
p nums.reject { |x| x % 3 == 0 && x != 0  }

# .select 
# returns values that do fit the given condition. 
# Multiples of five. 
# again, exclude 0. 
p nums.select { |x| x % 5 == 0 && x > 0 }



###################################
# Color Array 
colors = ['red', 'orange', 'yellow', 'green', 'blue', 'indigo', 'violet']

# 1 Print out a random color 
# .sample is outlined in Arrays.rb in this directory. 
p colors.sample(1)

# Print out the colors array in reverse order. 
p colors.reverse 

# Print out all colors with all caps 
# collect or map. 
# The collect() of enumerable is an inbuilt method in Ruby returns a new array with the
# results of running block once for every element in enum. The object is repeated every 
# time for each enum. In case no object is given, it return nil for each enum.
color_caps= colors.map { |word| word.upcase }
p color_caps
###########################################

# Methods 


# Write a method named find_area that finds the area of a rectangle when given values for width and height#

def find_area height, width 
 area= height * width 
 puts area 
end 

find_area 20, 20 

# Write a method named multiply_each_by_five that will loop over the given nums array below and print each number multiplied by 5
nums_one = [5, 5, 6, 7, 2, 4, 3, 2, 1, 9, 7, 6, 0, 0]

def multiply_each_by_five arr
arr.each_with_index { |item, index| p item*5 } 
end 

multiply_each_by_five nums_one 

#################################################################

#### Methods with a Hash 
# Write a method named print_price that will take in any hash and return the price of the item.
book = {
  title: 'The Great Gatsby',
  author: 'F Scott Fitzgerald',
  year: 1925,
  price: 10
}

lamp = {
  type: 'reading',
  brand: 'Ikea',
  price: 25
}

table = {
  type: 'bed side',
  brand: 'Crate & Barrel',
  color: 'birch',
  price: 50
}

def print_price hash 
flat=hash.flatten
index=flat.find_index(:price)
final_price= flat[index+1]
puts "The final price is: #{final_price} "
return final_price 
end 


print_price book 
print_price lamp 
print_price table 



# Write a method named print_item_sums that will take in two hashes and
#  will return the sum of the prices for the items in the hashes.

def print_item_sums hash1, hash2 
 one = print_price hash1 
 two = print_price hash2 
sums= one + two 
puts sums 
end 

print_item_sums book, lamp 
# ruby student_solution.rb 

###################################################
# Euler Problem 1
# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

# Find the sum of all the multiples of 3 or 5 below 1000.

# 1. Define a range and use splat to populate one. 
#2. Get all multiples. 
#3. Insert operator into array. 

def euler max 
a = (1...max).to_a 
euler_array = a.select { |x| x % 3 == 0 || x % 5 == 0 }
puts euler_array 
result=euler_array.reduce(:+)
puts result 
end 
euler 10 # it works for 10. 
euler 1000 # also works according to Quora. 

##################### Primes 

def check_prime? n 
n_max_two=Math.sqrt(n).floor 
not_count=0 
for i in 2..n_max_two
    if n % i == 0 
not_count +=1 
    end 
end 
if not_count > 0 
    return false 
    else 
    return true 
end 
end 

check_prime? 101929

def get_primes ceiling 
 a=(2..ceiling).to_a 
 puts a 
 prime_array = a.select { |x| check_prime?(x) == true }
 puts prime_array 
end 

get_primes 100 
get_primes 1000 
