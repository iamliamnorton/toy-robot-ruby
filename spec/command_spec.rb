require 'spec_helper'

describe Command do
  let(:command) { described_class.new(simulation: simulation) }

  let(:simulation) { instance_double(Simulation) }

  describe "#execute" do
    it "raises a exeception so subclasses must implement method" do
      expect{ command.execute }.to raise_error(Command::NotImplementedError)
    end
  end
end
