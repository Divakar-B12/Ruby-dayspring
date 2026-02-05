def fact(a)
  sum = 1
  for i in 1..a do
   sum*=i
  end
  puts "The factorial of the number: #{sum}"
end


puts "Enter a number: "
a = gets.chomp.to_i
fact(a)