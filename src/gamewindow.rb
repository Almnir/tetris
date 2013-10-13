require 'gosu'
require '../src/figure'
require '../src/globalvars'

class GameWindow < Gosu::Window
  include GlobalVars
  def initialize
    super(X_size, Y_size, false)
    self.caption = "Tetris game"

    @background_image = Gosu::Image.new(self, "h:\\RubyProjects\\tetris\\media\\background.bmp", true)

    @figure = Figure.new(self)
    @figure.warp(X_size/2, Y_size/2)
  end

  def update
    if button_down? Gosu::KbLeft or button_down? Gosu::GpLeft then
      @figure.strafe_left
    end
    if button_down? Gosu::KbRight or button_down? Gosu::GpRight then
      @figure.strafe_right
    end
    if button_down? Gosu::KbDown or button_down? Gosu::GpButton2 then
      @figure.strafe_down
    end
    if button_down? Gosu::KbSpace then
      @figure.drop_down
    end
    if button_down? Gosu::KbUp or button_down? Gosu::GpButton5 then
      @figure.turn
    end
    @figure.move
  end

  def draw
    @figure.draw
    @background_image.draw(0, 0, 0);
  end

  def button_down(id)
    if id == Gosu::KbEscape
      close
    end
  end
end
