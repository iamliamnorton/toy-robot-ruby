require 'command'

module Commands
  class Move < ::Command
    def execute
      return unless valid?

      place_command.execute
    end

    def valid?
      @simulation.robot_placed? && place_command.valid?
    end

    private

    def place_command
      @_place_command ||= Commands::Place.new(
        simulation: @simulation,
        arguments: @simulation.next_robot_position.values
      )
    end
  end
end
