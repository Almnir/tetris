require '../src/globalvars'

class Figure
  include GlobalVars
  def initialize(window)
    @velocity = 0.0
    @x = @y = 0.0
    @angle = 0.0
    @image = Gosu::Image.new(window, "h:\\RubyProjects\\tetris\\media\\tetris.bmp", false)
  end

  def warp(x, y)
    @x, @y = x, y
  end

  def turn
    if (@angle > 270)
      @angle = 0
    elsif
      @angle += 90.0
    end
  end

  def strafe_left
    @x -= 5.0
  end

  def strafe_right
    @x += 5.0
  end

  def strafe_down
    @y += 5.0
  end

  def drop_down
    @velocity = 10
  end

  def move
    @y += @velocity
  end

  def check_bounds
    x_bound = @image.width/2
    y_bound = @image.height/2
    if (@x + x_bound >= X_size)
      @x = X_size - x_bound
    end
    if (@x - x_bound <= 0)
      @x = 0 + x_bound
    end
    if (@y + y_bound >= Y_size)
      @y = Y_size - y_bound
    end
    if (@y - y_bound <= 0)
      @y = 0 + y_bound
    end
  end

  def draw
    check_bounds
    @image.draw_rot(@x, @y, 1, @angle)
  end
end