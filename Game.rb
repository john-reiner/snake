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