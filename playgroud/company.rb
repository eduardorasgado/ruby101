class Person
  @@counter = 0
  def initialize(name)
    @name = name
    @@counter +=1;
  end

  def greet
    puts "hello my name is #{@name} and we are #{@@counter} people over here"
  end
end

class Company
  attr_reader :employees
  def initialize(employees)
    @employees = employees
  end

  def all_employees_greeting
    @employees.each do |emp|
      emp.greet
    end
  end
end

bryan = Person.new("Bryan")
p2 = Person.new("Mary")
p3 = Person.new("Solovino")
p4 = Person.new("Tadeo")
people = [bryan, p2, p3, p4]

c = Company.new(people)
c.all_employees_greeting


