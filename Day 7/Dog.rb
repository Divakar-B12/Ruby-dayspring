require_relative 'Animal'
class Dog < Animal
  def speak
    "#{@name} says Woof!"
  end
end

dog = Dog.new("Snoopy")
# puts dog.respond_to?(:speak)  # Check if the dog object can respond to the speak method