require 'dxruby'

require_relative './lib/button'
require_relative './lib/pen'
require_relative './lib/pallete'


canvas = Image.new(Window.width, Window.height, C_WHITE)

pen = Pen.new(:circle, 20, C_BLUE)
pallete = Pallete.new

Window.loop do
  break if Input.key_down?(K_ESCAPE)

  pen.update
  pallete.update(pen)

  pen.draw(canvas)
  Window.draw(0, 0, canvas)
  pallete.draw(pen)

  Window.draw_font_ex(0, 0, "fps: #{Window.real_fps}", Font.default, color: [30, 30, 30])
end
