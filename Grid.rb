class Grid

    attr_reader :size, :height, :width

    def initialize(size, height, width)

        @size = size
        @height = height / @size
        @width = width / @size

    end

end