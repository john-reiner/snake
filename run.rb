require 'ruby2d'

require_relative "Snake"
require_relative "Game"
require_relative "Food"

set background: 'navy'
set fps_cap: 10
GRID_SIZE = 20  
GRID_HEIGHT = Window.height / GRID_SIZE
GRID_WIDTH = Window.width / GRID_SIZE

snake = Snake.new
game = Game.new
food = Food.new

# foods = []

# 10.times do 
#     foods.push(Food.new)
# end



update do
    
    clear

    
    
    unless game.finished?
        snake.move
        # foods.each do |food|
        #     food.draw
        # end
        food.draw
    end

    snake.draw
    game.draw

    if food.snake_eat_food?(snake.x, snake.y)
        food.ate_food
        game.increase_score
        snake.grow
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
    end
end

show