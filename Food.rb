class Food

    def initialize
        @food_x = rand(GRID_WIDTH)
        @food_y = rand(GRID_HEIGHT)
    end

    def draw
        Square.new(x: @food_x * GRID_SIZE, y: @food_y * GRID_SIZE, size: GRID_SIZE - 1, color: "red")
    end

    def snake_eat_food?(x, y)
        @food_x == x && @food_y == y
    end

    def ate_food
        @food_x = rand(GRID_WIDTH)
        @food_y = rand(GRID_HEIGHT)
    end

end