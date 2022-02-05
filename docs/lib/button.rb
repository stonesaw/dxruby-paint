# simple button class
# click & hover
class Button < Sprite
  attr_accessor :edge_color, :edge_color_focus

  def initialize(x, y, image, edge: true, click: true, hover: true)
    super(x, y, image)
    @edge_color = [200, 200, 200]
    @edge_color_focus = [174, 254, 255]
    @edge = edge
    @click = click
    @hover = hover

    if edge
      @edge_image = Image.new(image.width, image.height).draw(0, 0, image)
      @edge_image.box(0, 0, image.width, image.height, @edge_color)
    end
    if hover && edge
      @hover_image = Image.new(image.width, image.height).draw(0, 0, image)
      @hover_image.box(0, 0, image.width, image.height, @edge_color_focus)
    end
  end

  def update
    if  hover?
      self.image = @hover_image
    else
      self.image = @edge_image
    end
  end

  def draw
    Window.draw(x, y, image)
  end

  def hover?
    @hover &&
    (x..x + image.width).include?(Input.mouse_x) &&
    (y..y + image.height).include?(Input.mouse_y)
  end

  def click?(mouse_button = M_LBUTTON)
    hover? && Input.mouse_push?(mouse_button)
  end
end
