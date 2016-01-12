Dir[File.join(File.dirname(__FILE__), "commands/*.rb")].each do |file|
  require file
end

class CommandInterpreter
  def initialize(simulation:)
    @simulation = simulation
  end

  def parse(input)
    sanitized_input = input.gsub(","," ").split

    command_name = sanitized_input[0]
    command_args = sanitized_input[1..-1]

    command = command_map.fetch(command_name) { Commands::Null }
    command.new(simulation: @simulation, arguments: command_args)
  end

  private

  def command_map
    @_command_map ||= {
      "REPORT" => Commands::Report,
      "PLACE" => Commands::Place,
      "RIGHT" => Commands::Right,
      "LEFT" => Commands::Left,
      "MOVE" => Commands::Move,
    }
  end
end
