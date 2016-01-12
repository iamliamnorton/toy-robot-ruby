require 'command'

module Commands
  class Report < ::Command
    def execute
      return unless valid?

      puts @simulation.current_robot_position.values.join(",")
    end

    def valid?
      @simulation.robot_placed?
    end
  end
end
