=begin
  In here we defined an employee class
=end
class Employee
  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello, my name is: #{@name}"
  end
end

name = "Eduardo"
em1 = Employee.new(name)

em1.greet
