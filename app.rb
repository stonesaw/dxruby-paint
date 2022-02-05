# standalone app version

require 'dxruby'

require_relative './docs/lib/button'
require_relative './docs/lib/pen'
require_relative './docs/lib/pallet'


canvas = Image.new(Window.width, Window.height, C_WHITE)

pen = Pen.new(:circle, 20, C_BLUE)
pallet = Pallet.new

Window.loop do
  break if Input.key_down?(K_ESCAPE)

  pen.update
  pallet.update(pen)

  pen.draw(canvas)
  Window.draw(0, 0, canvas)
  pallet.draw(pen)

  Window.draw_font_ex(0, 0, "fps: #{Window.real_fps}", Font.default, color: [30, 30, 30])
end
