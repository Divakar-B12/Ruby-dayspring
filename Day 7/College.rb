class College
  def initialize(marks, address, email)
    @name = "Karthik"
    @branch = "CSE"
    @marks = 600  
    @address = Tamilnadu
    @email = "Karthik@gmail.com"
  end

  def initialize(name, branch, marks, address, email)
    @name = name
    @branch = branch
    @marks = marks  
    @address = address
    @email = email
  end

  def student_details
    puts "Name: #{@name}, Branch: #{@branch}, Marks: #{@marks}, Address: #{@address}, Email: #{@email}"
end

def college_info
    puts "This is a College class method."
  end
end