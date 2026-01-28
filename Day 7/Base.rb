class Base
  def display
  end

  def freeze
  end

  def help
  end

end 

# puts Base.respond_to?(:display)
puts Base.respond_to?(:freeze)
puts Base.new.respond_to?(:help)
