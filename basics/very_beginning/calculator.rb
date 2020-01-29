class Calculator
  def initialize(operations)
    @operations = operations
    @actual_operation = ""
    @x_val = 0
    @y_val = 0
    @exit = false
  end

  def get_exit
    @exit
  end

  def valid_operation

    for operation_element in @operations
      if operation_element == @actual_operation.to_s
        true
      end
    end
  end

  def get_first_value
    puts "X: "
    @x_val = gets.to_i
  end

  def get_second_value
    puts "Y: "
    @y_val = gets.to_i
  end

  def get_operation(operation)
    @actual_operation = operation
    if @actual_operation.to_i == 1
      exit(true)
    else
      @actual_operation.to_s
      if valid_operation
        get_first_value
        get_second_value
        process_operation
      else
        puts "your operation is not valid"
      end
    end

  end

  def process_operation
    if @actual_operation == "+"
      addition
    elsif @actual_operation == "-"
      subtraction
    end
  end

  def addition
    result = @y_val + @x_val
  end

  def subtraction
    result = @x_val + @y_val
  end

  def print_operations
    for operation in @operations
      puts "operation #{operation}"
    end
    puts "exit: 1"
  end
end

def assigning_operations(operations)
  Calculator.new(operations)
end

def main
  operations = %w(+ - * /)
  c1 = assigning_operations(operations)
  while not c1.get_exit
    puts "what do you want to do: "
    c1.print_operations
    operation = gets
    c1.get_operation(operation)
  end
end

main