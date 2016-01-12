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

  def range
    case orientation
    when NORTH
      { y_position: 1 }
    when SOUTH
      { y_position: -1 }
    when WEST
      { x_position: -1 }
    when EAST
      { x_position: 1 }
    end
  end
end
