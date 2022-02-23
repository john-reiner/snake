class Grid

    attr_reader :size, :height, :width

    def initialize(size, height, width)

        @size = size
        @height = height / @size
        @width = width / @size

    end

    def print_window_specs
        puts "Grid Size: #{@size}", "Grid Height: #{@height}", "Grid Width: #{@width}"
    end

end