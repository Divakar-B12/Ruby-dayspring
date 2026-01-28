class Maths
  def addition(*args)
    args.sum
  end

  def subtraction(a, b)
    a - b
  end 

  def multiplication(a, b)
    a * b
  end     

  def division(a, b)
    a / b
  end 
  
  def modulus(a, b)
    a % b
  end 

  def exponent(a, b)
    a**b
  end

  def floor_division(a, b)
    a.floor / b.floor
  end

end


class Calculator < Maths

  calci = Calculator.new
  puts calci.addition(10, 5,6,9)
  puts calci.subtraction(10, 5) 
  puts calci.multiplication(10, 5)
  puts calci.division(10, 5)
  puts calci.modulus(10, 5)
  puts calci.exponent(10, 5)
  puts calci.floor_division(10, 5)
end