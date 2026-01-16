# # puts "Single line comments below"

# # Ruby Single-Line Comments

# # puts "Multi line comments below"

# =begin
# Comment line 1 
# Comment line 2  
# Comment line 3
# =end


# class Sample
#   def initialize(number, float, boolean, string, symbol, array, hash, range, nil_value)
#     @number = number
#     @float = float
#     @boolean = boolean
#     @string = string
#     @symbol = symbol
#     @array = array
#     @hash = hash
#     @range = range
#     @nil_value = nil_value
#   end

#   def display_types
#     puts "Number: #{@number} (#{@number.class})"
#     puts "Float: #{@float} (#{@float.class})"
#     puts "Boolean: #{@boolean} (#{@boolean.class})"
#     puts "String: #{@string} (#{@string.class})"
#     puts "Symbol: #{@symbol} (#{@symbol.class})"
#     puts "Array: #{@array} (#{@array.class})"
#     puts "Hash: #{@hash} (#{@hash.class})"
#     puts "Range: #{@range} (#{@range.class})"
#     puts "Nil Value: #{@nil_value} (#{@nil_value.class})"
#   end
# end

# sample = Sample.new(42, 3.14, true, "Hello, Ruby!", :ruby_symbol, [1, 2, 3], {key: "value"}, (1..10), nil)
# sample.display_types


# Addition of Two Numbers
# print " Enter your name: "
# name = gets.chomp.upcase
# print "Enter the first number"
# a = gets.chomp.to_i
# print "Enter the second number"
# b = gets.chomp.to_i
# sum = a + b
# puts "The sum of #{a} and #{b} is #{sum}"
# puts "Hello! #{name}!"


print "Enter your name:"
Name = gets.chomp
puts "Hello #{Name} welcome"
