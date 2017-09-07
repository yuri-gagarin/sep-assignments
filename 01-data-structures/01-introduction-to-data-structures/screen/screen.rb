require_relative 'pixel'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
    @width = width
    @height = height
    @matrix = {}
  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)

    x = inbounds_x(x)
    y = inbounds_y(y)

    @matrix["#{x}, #{y}"] = pixel

  end

  def at(x, y)
    return @matrix["#{x}, #{y}"]
  end

  private

  def inbounds_x(x)
    if (x < 0 || x > @width)
      return nil
    else
      return x
    end
  end

  def inbounds_y(y)
    if (y < 0 || y > @height)
      return nil
    else
      return y
    end
  end

end

pixel1 = Pixel.new(243, 17, 258, 4, 7)
pixel2 = Pixel.new(245, 280, 258, 9, 12)
pixel3 = Pixel.new(243, 17, 258, 19, -7)

screen = Screen.new(640, 480)
screen.insert(pixel1, pixel1.x, pixel1.y)
screen.insert(pixel2, pixel2.x, pixel2.y)
screen.insert(pixel3, pixel3.x, pixel3.y)

puts screen.matrix