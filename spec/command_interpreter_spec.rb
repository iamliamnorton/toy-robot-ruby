require 'spec_helper'

describe CommandInterpreter do
  subject(:command_interpreter) { described_class.new(simulation: simulation) }

  let(:simulation) { instance_double(Simulation) }

  describe "#parse" do
    {
      # input creates a NullCommand object
      "SELF DESTRUCT"         => Commands::Null,
      "place 1,2,EAST"        => Commands::Null,
      "PLACEit 1,2,EAST"      => Commands::Null,
      ""                      => Commands::Null,
      # input creates a Command object
      "PLACE"                 => Commands::Place,
      "PLACE 1,2,EAST"        => Commands::Place,
      " PLACE  1, 2 , EAST "  => Commands::Place,
      "PLACE 1,2,east"        => Commands::Place,
      "PLACE 1,2,north,east"  => Commands::Place,
      "REPORT"                => Commands::Report,
      "REPORT 123"            => Commands::Report,
      "MOVE"                  => Commands::Move,
      "MOVE me"               => Commands::Move,
      "LEFT"                  => Commands::Left,
      "RIGHT"                 => Commands::Right,
    }.each do |input, command|
      it "with input '#{input}' it returns a #{command} object" do
        expect(command_interpreter.parse(input)).to be_a(command)
      end
    end
  end
end
