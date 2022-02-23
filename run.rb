require 'ruby2d'

require_relative "Snake"
require_relative "Game"
require_relative "Food"
require_relative "Header"
require_relative "Grid"

set background: 'navy'
set fps_cap: 2

grid = Grid.new(20, Window.height, Window.width)
snake = Snake.new
game = Game.new

foods = [Food.new(grid.height, grid.width)]
header = Header.new(grid.size, 2)
grid.print_window_specs

update do

    clear

    header.draw(game.finished, game.level, game.score)

    unless game.finished
        if foods.count < game.level
            foods.push(Food.new(grid.height, grid.width))
        end
        foods.each do |food|
            food.draw(grid.size)
        end
        snake.move(grid.height, grid.width, header.size)
    end

    snake.draw(grid.size)
    # game.draw

    foods.each do |food|
        if food.snake_eat_food?(snake.x, snake.y)
            food.ate_food(grid.height, grid.width)
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