class Game
    def initialize
        @score = 0
        @ball_x = rand(GRID_WIDTH)
        @ball_y = rand(GRID_HEIGHT)
        @finished = false
        @level = 1
    end

    def draw
        Text.new(text_message, color: "blue", x:10, y:10, size: 20)
    end

    def snake_hit_ball?(x, y)
        @ball_x == x && @ball_y == y
    end

    def increase_score
        @score += 1
        if @score % 10 == 0
            @level += 1
            puts @level
        end
    end

    def finish
        @finished = true
    end

    def finished?
        @finished
    end

    def level
        @level
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