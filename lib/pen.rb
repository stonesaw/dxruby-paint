# pen class
# - draw
# - some config

class Pen
  attr_accessor :type, :size, :color1, :color2

  def initialize(type, size, color1, color2 = C_WHITE)
    @type = type
    @size = size
    @color1 = color1
    @color2 = color2

    update
  end
  
  def update
    # create image
    @_image1 = Image.new(@size, @size, [0, 0, 0, 0])
    @_image2 = Image.new(@size, @size, [0, 0, 0, 0])
    case @type
    when :box
      @_image1.box_fill(0, 0, @size, @size, @color1)
      @_image2.box_fill(0, 0, @size, @size, @color2)
    when :circle
      @_image1.circle_fill(@size / 2, @size / 2, @size / 2, @color1)
      @_image2.circle_fill(@size / 2, @size / 2, @size / 2, @color2)
    else
      raise "unknown type"
    end
  end

  def draw(canvas)
    if Input.mouse_down?(M_LBUTTON)
      canvas.draw(Input.mouse_pos_x - @size / 2, Input.mouse_pos_y - @size / 2, @_image1)
    elsif Input.mouse_down?(M_RBUTTON)
      canvas.draw(Input.mouse_pos_x - @size / 2, Input.mouse_pos_y - @size / 2, @_image2)
    else
    end
  end
end
