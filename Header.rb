class Header

    def initialize
        @x = 0
        @y = 0
        @height = GRID_SIZE * 2

    end

    def draw(finished, level, score)

        Rectangle.new(
            x: @x, y: @y,
            width: Window.width, height: @height,
            color: 'black',
        )
        if finished
            Text.new("Game Over! Score: #{score}. Press 'r' to restart", color: "lime", x:10, y:10, size: 20)
        else
            Text.new("Score: #{score}", color: "lime", x:10, y:10, size: 20)
            Text.new("Level: #{level}", color: "lime", x:300, y:10, size: 20)
        end
    end

    def increase_score
        @score += 1
        if @score % 10 == 0
            @level += 1
        end
    end

end