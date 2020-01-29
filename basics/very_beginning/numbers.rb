# prints a float, automatically converts it to a float
puts 1.0 + 2

puts 3 / 2

puts 3.0 / 2

puts -99

puts -99.abs

puts Math.sqrt(-81.abs).to_int

#challenge
def playing_with_numbers(hours_in_year, minutes_in_decade, age)
  age_in_seconds = 0
  # Write - Your - Code

  hours_in_year = (24 * 31 * 7) + (24 * 30 * 4) + (24 * 28 )
  minutes_in_decade = hours_in_year * 60 * 10
  age_in_seconds = hours_in_year * 60 * 60 * age

  return hours_in_year, minutes_in_decade, age_in_seconds
end
#modulo challenge
def calculate_mod(num1, num2)
  result = -1
  # Write - Your - Code
  result = num1 % num2

  return result
end

# even odd challenge
def even_or_odd(num)
  result = ""
  if num.even?
    result = "even"
  else
    result = "odd"
  end

  return result
end