Conditional statements in Ruby

stock = 0
is_available = false 
if stock > 0
  is_available = true
else 
  puts "Item not available"
end
puts "Is the item available? #{is_available}" 


condition ? value_if_true : value_if_false


is_active = true
puts is_active ? "Stock is available" : "Stock is not available"

is_active = true

is_active ? puts("Stock is available") : puts("Stock is not available")

price = 50 
discount = 0
if price > 40
  discount = 10
elsif price > 200
  discount = 20
elsif price > 300
  discount = 30
else 
  discount = 5
end 

puts discount

price = 150
discount = 0

if price >= 300
  discount = 30
elsif price >= 200
  discount = 20
elsif price >= 100
  discount = 10
else
  discount = 5
end

puts discount


marks = 100

case marks
when 90..100
  puts "A+"
when 80..90
  puts "B+"
when 70..80
  puts "C+"
else 
  puts "Fail"
end


marks = 75

case marks
when 90..100
  puts "Grade A"
when 70..89
  puts "Grade B"
when 50..69
  puts "Grade C"
else
  puts "Fail"
end

mark = 90

case 
when mark>=100
  puts "Grade A"
when mark>=90
  puts "Grade B"
when mark>=80
  puts "Grade C"
else
  puts "Fail"
end


unless

is_logged_in = false

unless is_logged_in
  puts "Please login first"
end

is_email = false

unless is_email 
  puts "Email is not entered"
end

is_number = 

unless is_number
  puts "Number is not there"
else
  puts "Number is there"
end

print is_number.class  


