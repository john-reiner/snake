class Snake

    attr_writer :direction

    def initialize
        @positions = [[2,4], [2,5], [2,6], [2,7]]
        @direction = 'down'
        @growing = false
    end

    def draw(size)
        @positions.each do |position|
            Square.new(x: position[0] * size, y: position[1] * size, size: size - 1, color: "yellow")
        end
    end

    def move(grid_height, grid_width, header_size)
        
        if !@growing
            @positions.shift
        end
        
        case @direction
        when 'down'
            @positions.push(new_coordinates(head[0], head[1] + 1, grid_height, grid_width, header_size))
        when 'up'
            @positions.push(new_coordinates(head[0], head[1] - 1, grid_height, grid_width, header_size))
        when 'left'
            @positions.push(new_coordinates(head[0] - 1, head[1], grid_height, grid_width, header_size))
        when 'right'
            @positions.push(new_coordinates(head[0] + 1, head[1], grid_height, grid_width, header_size))
        end

        @growing = false
    end

    def can_change_direction_to?(new_direction)
        case @direction
        when 'up' then new_direction != 'down'
        when 'down' then new_direction != 'up'
        when 'left' then new_direction != 'right'
        when 'right' then new_direction != 'left'
        end

    end

    def x
        head[0]
    end 
    
    def y
        head[1]
    end

    def grow
        @growing = true
    end

    def hit_itself?
        @positions.uniq.length != @positions.length
    end

    private

    def new_coordinates(x, y, grid_height, grid_width, header_size)
        if y < header_size
            [x % grid_width, grid_height - 1]
        elsif y >= grid_height
            [x % grid_width, header_size]
        else
            [x % grid_width, y % grid_height]
        end
    end

    def head
        @positions.last
    end
end