class Header

    attr_reader :size

    def initialize(grid_size, size)

        @x = 0
        @y = 0
        @size = size
        @height = grid_size * @size

    end

    def draw(finished, level, score, high_score)

        Rectangle.new(
            x: @x, y: @y,
            width: Window.width, height: @height,
            color: 'black',
        )
        if finished
            Text.new("Game Over! Press 'r' to restart", color: "lime", x: 180, y:5, size: 20)
            Text.new("Score: #{score}", color: "lime", x:10, y:5, size: 20)
            Text.new("Level: #{level}", color: "lime", x:550, y:5, size: 20)
        else
            Text.new("High Score: #{high_score}", color: "lime", x: 180, y:5, size: 20)
            Text.new("Score: #{score}", color: "lime", x:10, y:5, size: 20)
            Text.new("Level: #{level}", color: "lime", x:550, y:5, size: 20)
        end
    end

    def increase_score
        @score += 1
        if @score % 10 == 0
            @level += 1
        end
    end

end