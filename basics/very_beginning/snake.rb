require 'ruby2d'

set title: 'Snake Game'
set background: 'navy'
set fps_cap: 5

# height: 480 / 20 = 24
# width: 640 / 20 = 32

GRID_SIZE = 20
GRID_HEIGHT = 24
GRID_WIDTH = 32

# This class represents the snake while gaming
class Snake
  # adding setters and getters
  attr_reader :direction, :positions
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
      @positions.push([head[0],
                       (head[1] + 1) % GRID_HEIGHT])
    when 'up'
      @positions.push([head[0],
                       (head[1] - 1) % GRID_HEIGHT])
    when 'left'
      @positions.push([(head[0] - 1) % GRID_WIDTH,
                       head[1]])
    when 'right'
      @positions.push([(head[0] + 1) % GRID_WIDTH,
                       head[1]])
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

  def add_tail
    @positions.unshift([tail[0], tail[1]])
  end

  # returns snake head in x position
  def x
    head[0]
  end

  # return snake head in y position
  def y
    head[1]
  end

  private

  # returns the snake head position list
  def head
    @positions.last
  end

  def tail
    @positions.first
  end
end

# this class represents the game logic
class Game
  attr_reader :pause
  attr_writer :pause

  def initialize
    @score = 0
    @food_x = rand(GRID_WIDTH)
    @food_y = rand(GRID_HEIGHT)
    @pause = false
  end

  def pause_or_not
    @pause = !@pause
    if @pause
      Text.new("Game Paused", color: "red",
               x: ((GRID_WIDTH / 2) * GRID_SIZE) - 150, y: ((GRID_HEIGHT / 2) * GRID_SIZE) - 50, size:50)
    end
  end

  # draw the food into the game screen
  def draw
    # drawing food
    Square.new(x: @food_x * GRID_SIZE, y: @food_y * GRID_SIZE,
               size: GRID_SIZE - 1, color: 'yellow')
    # drawing the score text
    Text.new("Score: #{@score}", color: "green",
             x: 10, y:10, size:25)
  end

  # determine whether snake head position is same than food or not
  def snake_hit_food?(snake_x, snake_y)
    snake_x == @food_x && snake_y == @food_y
  end

  # actions that proceeds after user hits the food
  def record_hit(snake_positions)
    # increasing the user score
    @score += 1
    # new food position
    in_process = true
    test_food_x = 0
    test_food_y = 0
    # food never will apear in a position equals to some location
    # of snake body
    while in_process
      test_food_x = rand(GRID_WIDTH)
      test_food_y = rand(GRID_HEIGHT)
      food_is_crossed = false
      snake_positions.each do |pos|
        food_is_crossed = pos[0] == test_food_x && pos[1] == test_food_y
      end
      unless food_is_crossed
        in_process = false
      end
    end
    @food_x = test_food_x
    @food_y = test_food_y
  end
end

snake = Snake.new
game = Game.new

# game loop logic
update do
  unless game.pause
    clear
    snake.move
    game.draw
    snake.draw
    if game.snake_hit_food?(snake.x, snake.y)
      game.record_hit(snake.positions)
      snake.add_tail
    end
  end
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
  if event.key == "p"
    game.pause_or_not
  end
end

# actual frame is shown
show