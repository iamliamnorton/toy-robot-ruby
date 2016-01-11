require 'table'
require 'robot'

class Simulation
  attr_reader :table
  attr_reader :robot

  def initialize(table: Table.new, robot: Robot.new)
    @table = table
    @robot = robot
  end
end
