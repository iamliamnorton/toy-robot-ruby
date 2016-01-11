require 'spec_helper'

describe Commands::Null do
  let(:command) { described_class.new(simulation: instance_double(Simulation)) }

  describe "#execute" do
    subject(:execute) { command.execute }

    it { is_expected.to eq(nil) }
  end
end
