require 'ruby2d'

set title: 'Snake Game'
set background: 'navy'

# height: 480 / 20 = 24
# width: 640 / 20 = 32

GRID_SIZE = 20

# This class represents the snake while gaming
class Snake
  def initialize
    @positions = [[2, 0], [2, 1], [2, 2], [2, 3]]
  end

  # This function will draw the snake every frame
  def draw
    @positions.each do |position|
      Square.new(x: position[0] * GRID_SIZE, y: position[1] * GRID_SIZE,
                 size: GRID_SIZE - 1, color: 'white')
    end
  end
end

s = Snake.new
s.draw
show