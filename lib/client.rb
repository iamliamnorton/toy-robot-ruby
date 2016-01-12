require 'simulation'
require 'command_interpreter'

class Client
  def initialize(input: ARGF, simulation: Simulation.new)
    @input = input
    @command_interpreter = CommandInterpreter.new(simulation: simulation)
  end

  def start
    @input.each_line do |line|
      command = @command_interpreter.parse(line)
      command.execute
    end
  end
end
