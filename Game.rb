class Game

    attr_reader :level, :score, :finished, :high_score

    def initialize
        @score = 0
        @finished = false
        @level = 1
        @high_score = File.read("score.txt")
    end

    def snake_hit_ball?(x, y)
        @ball_x == x && @ball_y == y
    end

    def increase_score
        @score += 1
        if @score % 10 == 0
            @level += 1
        end
    end

    def finish
        @finished = true
    end

    def check_high_score
        if @score > @high_score.to_i
            @high_score = @score 
            File.write("score.txt", @high_score)
        end
    end

    private

    def text_message
        if finished?
            "Game Over! Score: #{@score}. Press 'r' to restart"
        else
            "Score: #{@score}"
        end
    end 
end