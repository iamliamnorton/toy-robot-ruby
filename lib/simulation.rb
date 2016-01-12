require 'table'
require 'robot'

class Simulation
  attr_reader :table
  attr_reader :robot

  def initialize(table: Table.new, robot: Robot.new)
    @table = table
    @robot = robot
  end

  def table_position_available?(x_position:, y_position:)
    table.x_range.cover?(x_position) && table.y_range.cover?(y_position)
  end

  def place_robot(x_position:, y_position:, orientation:)
    robot.x_position = x_position
    robot.y_position = y_position
    robot.orientation = orientation
  end
end
