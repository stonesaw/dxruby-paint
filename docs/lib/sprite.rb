# override DXRuby::Sprite
class Sprite
  def click?
    if Input.mouse_down?(M_LBUTTON) & 
      (x..x + image.width).include?(Input.mouse_x) &
      (y..y + image.height).include?(Input.mouse_y)
      return true
    else
      return false
    end
  end
end