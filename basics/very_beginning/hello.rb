puts "Hello ruby newbie here\n"

# In this file we will see all the ruby coding basics
name = "Eduardo Rasgado"
puts "How old are you?"
age = gets

puts "My name is #{name} and i am #{age} yo"

puts "give me x: "
x = gets
puts "give me y: "
y = gets

#conditionals
if x > y
	puts "x is greater thant y"
elsif x < y
	puts "y is greater than x"
else
	puts "x and y are the same"
end

def sum(x, y)
	return (x.to_i + y.to_i)
end

z = sum(x, y)
puts z
