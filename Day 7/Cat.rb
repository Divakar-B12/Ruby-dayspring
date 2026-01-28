require_relative 'Animal'
class Cat < Animal
  # def speak
  #   "#{@name} says Meow!"
  # end

  # def initialize(name)
  #   super(speak("Luna"))      # calls Animal's initialize
  # end


  def puts
    "says Meow!"
  end
# cat1 = Cat.new("Luna")
end

puts Cat.ancestors  #ancestors shows the full inheritance chain Ruby follows for method lookup.

# puts Cat.respond_to?(:speak)  # Check if the cat1 object can respond to the speak method

# puts cat1.class.respond_to?(:upper)  # Output: Luna says Meow!

# cat = Cat.new()
# puts cat.puts
# end