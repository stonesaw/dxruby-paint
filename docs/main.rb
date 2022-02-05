require 'dxopal'
include DXOpal

require_remote '/lib/button.rb'
require_remote '/lib/pen.rb'
require_remote '/lib/pallete.rb'

Window.load_resources do
  Window.bgcolor = C_BLACK
  
  canvas = Image.new(Window.width, Window.height, C_WHITE)

  pen = Pen.new(:circle, 20, C_BLUE)
  # TODO : Error: cant use RenderTarget
  # pallete = Pallete.new

  Window.loop do
    pen.update
    # TODO
    # pallete.update(pen)

    pen.draw(canvas)
    Window.draw(0, 0, canvas)
    # TODO
    # pallete.draw(pen)

    Window.draw_font(0, 0, "fps: #{Window.real_fps}", Font.default, color: [30, 30, 30])
  end
end

