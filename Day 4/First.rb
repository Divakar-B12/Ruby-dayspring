$count = 0 
class Product
    

  def initialize(name, price, category)
    @name = name
    @price = price
    @category = category
    $count += 1
  end

  def fetch_data
    puts "Name: #{@name}"
    puts "Price: #{@price}"
    puts "Category: #{@category}"
    puts "Total Products Count: #{@@count}"
  end

 
  # def Product.count
  #   @@count
  # end
end

p1 = Product.new("Car", 500000, "Vehicle")
p2 = Product.new("Bike", 100000, "Vehicle")
p3 = Product.new("Laptop", 70000, "Electronics")

puts $count


# def MyName(name)
#   puts "My name is #{name}"
# end

# MyName("Divakar")