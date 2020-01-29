=begin
  In here we defined an employee class
=end
class Employee
  @@employee_counter = 0

  def initialize(name)
    @name = name
    # every time class initializes, this value increments for all objects
    @@employee_counter += 1
  end

  def greet
    puts "Hello, my name is: #{@name}"
  end

  def total_of_employees
    puts @@employee_counter
  end
end

name = "Eduardo"
name2 = "Marcelo"
name3 = "Cristina"
em1 = Employee.new(name)
em2 = Employee.new(name)
em3 = Employee.new(name)


em1.greet

em1.total_of_employees
em2.total_of_employees
em3.total_of_employees
