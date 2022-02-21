require 'ruby2d'

require_relative "Snake"

set background: 'navy'
set fps_cap: 10
GRID_SIZE = 20  
GRID_HEIGHT = Window.height / GRID_SIZE
GRID_WIDTH = Window.width / GRID_SIZE



class Game
    def initialize
        @score = 0
        @ball_x = rand(GRID_WIDTH)
        @ball_y = rand(GRID_HEIGHT)
        @finished = false
    end

    def draw
        unless finished?
            Square.new(x: @ball_x* GRID_SIZE, y: @ball_y * GRID_SIZE, size: GRID_SIZE - 1, color: "green")
        end
        Text.new(text_message, color: "blue", x:10, y:10, size: 20)
    end

    def snake_hit_ball?(x, y)
        @ball_x == x && @ball_y == y
    end

    def record_hit
        @score += 1
        @ball_x = rand(GRID_WIDTH)
        @ball_y = rand(GRID_HEIGHT)
    end

    def finish
        @finished = true
    end

    def finished?
        @finished
    end

    private

    def text_message
        if finished?
            "Game Over: Score: #{@score}. Press 'r' to restart"
        else
            "Score: #{@score}"
        end
    end 
end

snake = Snake.new
game = Game.new 


update do
    clear
    unless game.finished?
        snake.move
    end
    snake.draw
    game.draw

    if game.snake_hit_ball?(snake.x, snake.y)
        game.record_hit
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