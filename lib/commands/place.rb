require 'command'

module Commands
  class Place < ::Command
    def execute
      return unless valid?

      @simulation.place_robot(
        x_position: x_position,
        y_position: y_position,
        orientation: orientation
      )
    end

    def valid?
      valid_table_position? && valid_orientation?
    end

    private

    def place_arguments
      @_place_arguments ||= Hash[
        [:x_position, :y_position, :orientation].zip(@arguments)
      ]
    end

    def x_position
      @_x_position ||= Integer place_arguments.fetch(:x_position)
    end

    def y_position
      @_y_position ||= Integer place_arguments.fetch(:y_position)
    end

    def orientation
      @_orientation ||= place_arguments[:orientation]
    end

    def valid_table_position?
      @simulation.table_position_available?(
        x_position: x_position,
        y_position: y_position
      )
    rescue ArgumentError, TypeError, KeyError
      false
    end

    def valid_orientation?
      Robot::ORIENTATIONS.include?(orientation)
    rescue KeyError
      false
    end
  end
end
