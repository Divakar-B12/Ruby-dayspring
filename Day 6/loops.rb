#FOR LOOP
# Array = ["Apple","Ruby","Divakar","Java"]
# for i in Array do
#   puts i
# end

#While loop
# x=0
# while x<Array.length do
#   puts Array[x]
#   x+=1
# end

# loop do
#   puts "Hello World"
#   val = '7'

#   if val=='7'
#     break
#   end
 
#   end

# val = 1
#   until val==8 do
#     puts "Divakar"
#     val+=1
#   end

# for i in 1...10
#   puts i
#   if i==5
#     break
#   end
# end



#Table
# print "Enter the numbers: "
# table = gets.chop.to_i
# for i in 1...10
#   puts "#{table} x #{i} = #{table*i}"
# end

a = 7
arr = [101,102,103,104,105]

arr.select do |a|
  puts a if a%2==0
end