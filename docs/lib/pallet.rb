# color pallet
class Pallet
  def initialize(height = 100)
    @width = Window.width
    @height = height
    @x = 0
    @y = Window.height - @height
    @bgcolor = [239, 239, 239]
    @bg = Image.new(@width, @height, @bgcolor)
    @col = 8
    @row = 2
    @padding = 8
    @box_w = (@height - @padding * (@row + 1)) / @row
    @colors = [
      C_BLACK,
      C_WHITE,
      C_RED,
      C_YELLOW,
      C_GREEN,
      C_CYAN,
      C_BLUE
    ]
    
    update_color_buttons()
  end

  def update(pen)
    @color_buttons.each do |cbtn|
      cbtn.update
      if cbtn.click?
        pen.color1 = cbtn.image[cbtn.image.width / 2, cbtn.image.height / 2]
      elsif cbtn.click?(M_RBUTTON)
        pen.color2 = cbtn.image[cbtn.image.width / 2, cbtn.image.height / 2]
      end
    end
  end

  def draw(pen)
    # now color
    @bg.box_fill(10, @padding, 10 + @box_w, @height - @padding, pen.color1)
       .box(     10, @padding, 10 + @box_w, @height - @padding, [200, 200, 200])
    @bg.box_fill(18 + @box_w, @padding, 18 + 2 * @box_w, @height - @padding, pen.color2)
       .box(     18 + @box_w, @padding, 18 + 2 * @box_w, @height - @padding, [200, 200, 200])
    
    
    Window.draw(@x, @y, @bg)
    @bg = Image.new(@width, @height, @bgcolor) # refresh bg
    @color_buttons.each {|cbtn| cbtn.draw() }
  end

  def update_color_buttons
    @color_buttons = []
    @row.times do |y|
      @col.times do |x|
        x1 = 110 + @padding + x * (@box_w + @padding)
        y1 = @padding + y * (@box_w + @padding)
        color = @colors[x + y * @col]
        @color_buttons << Button.new(
          @x + x1, @y + y1, 
          Image.new(@box_w, @box_w, color ? color : @bgcolor),
          hover: !color.nil?
        )
      end
    end
  end
end
