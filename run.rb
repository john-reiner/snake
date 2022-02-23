require 'ruby2d'

require_relative "Snake"
require_relative "Game"
require_relative "Food"
require_relative "Header"

set background: 'navy'
set fps_cap: 10
GRID_SIZE = 20  
GRID_HEIGHT = Window.height / GRID_SIZE
GRID_WIDTH = Window.width / GRID_SIZE

snake = Snake.new
game = Game.new
food = Food.new

foods = [Food.new]
header = Header.new
# game level needs to match how many food objects are on the screen


update do

    clear

    header.draw

    unless game.finished?
        if foods.count < game.level
            foods.push(Food.new)
        end
        foods.each do |food|
            food.draw
        end
        snake.move
    end

    snake.draw
    game.draw

    foods.each do |food|
        if food.snake_eat_food?(snake.x, snake.y)
            food.ate_food
            game.increase_score
            snake.grow
        end
    end


    if snake.hit_itself?
        game.finish
    end

end

on :key_down do |event|
    if ['up', 'down', 'left', 'right'].include?(event.key)
        if snake.can_change_direction_to?(event.key)
            snake.direction = event.key
        end
    elsif event.key == 'r'
        snake = Snake.new
        game = Game.new
        foods = [Food.new]
    end
end

show