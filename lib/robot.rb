class Robot
  ORIENTATIONS = [
    NORTH = 'NORTH',
    EAST = 'EAST',
    SOUTH = 'SOUTH',
    WEST = 'WEST',
  ]

  attr_accessor :x_position
  attr_accessor :y_position
  attr_accessor :orientation

  def position
    {
      x_position: x_position,
      y_position: y_position,
      orientation: orientation,
    }
  end
end
