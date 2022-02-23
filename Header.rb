class Header

    def initialize
        @x = 0
        @y = 0
        @height = 40
        @score = nil
        @level = nil
        @message = nil
    end

    def draw

        Rectangle.new(
            x: @x, y: @y,
            width: Window.width, height: @height,
            color: 'teal',
            z: 20
        )
        
    end

end