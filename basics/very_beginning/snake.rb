require 'ruby2d'

set title: 'Snake Game'
set background: 'navy'
set fps_cap: 5

# height: 480 / 20 = 24
# width: 640 / 20 = 32

GRID_SIZE = 20

# This class represents the snake while gaming
class Snake
  def initialize
    @positions = [[2, 0], [2, 1], [2, 2], [2, 3]]
    @direction = 'down'
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
      next_head_pos = [head[0], head[1] + 1]
      @positions.push(next_head_pos)
    end
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

show