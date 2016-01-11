class Command
  NotImplementedError = Class.new(NoMethodError)

  def initialize(simulation:, arguments: [])
    @simulation = simulation
    @arguments = arguments
  end

  def execute
    raise NotImplementedError, "Subclasses must implement #execute"
  end
end
