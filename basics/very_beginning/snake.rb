require 'ruby2d'

set title: 'Snake Game'
set background: 'navy'
set fps_cap: 5

# height: 480 / 20 = 24
# width: 640 / 20 = 32

GRID_SIZE = 20

# This class represents the snake while gaming
class Snake
  # adding setters and getters
  attr_reader :direction
  attr_writer :direction

  def initialize
    @positions = [[2, 0], [2, 1], [2, 2], [2, 3]]
    @direction = 'down'
    @move_patterns = [%w(up down), %w(right left)]
  end

  # This function will draw the snake every frame
  def draw
    @positions.each do |position|
      Square.new(x: position[0] * GRID_SIZE, y: position[1] * GRID_SIZE,
                 size: GRID_SIZE - 1, color: 'white')
    end
  end

  # reading direction that user gives the snake
  def move
    # removing first element from the snake body
    @positions.shift
    # reading direction
    case @direction
    when 'down'
      # adding one to y in snake head
      @positions.push([head[0] % 32,
                       (head[1] + 1) % 24])
    when 'up'
      @positions.push([head[0] % 32,
                       (head[1] - 1) % 24])
    when 'left'
      @positions.push([(head[0] - 1) % 32,
                       head[1] % 24 ])
    when 'right'
      @positions.push([(head[0] + 1) % 32,
                       head[1] % 24])
    end
  end

  # method to be able to check the next direction is not opossite to actual direction
  def snake_can_change_direction?(key)
    value = false
    @move_patterns.each do |move|
      if move.include?(key)
        unless move.include?(key) && move.include?(@direction)
          value = true
        end
      end
    end
    value
  end

  private

  # returns the snake head position list
  def head
    @positions.last
  end
end

snake = Snake.new

update do
  clear
  snake.move
  snake.draw
end

# reading the user keys and assign it to snake position
on :key_down do |event|
  # just if the key pressed is within the list then direction will change
  moves = %w(up down right left)
  if moves.include?(event.key)
    if snake.snake_can_change_direction?(event.key)
      snake.direction = event.key
    end
  end
end
show