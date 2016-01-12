require 'spec_helper'

describe Commands::Left do
  let(:command) { described_class.new(simulation: simulation) }

  describe "#valid?" do
    subject { command.valid? }

    context "when the robot has been placed" do
      let(:simulation) { instance_double(Simulation, robot_placed?: true) }

      it { is_expected.to eq(true) }
    end

    context "when the robot has not been placed" do
      let(:simulation) { instance_double(Simulation, robot_placed?: false) }

      it { is_expected.to eq(false) }
    end
  end

  describe "#execute" do
    let(:simulation) {
      instance_double(Simulation, robot_placed?: true, next_robot_position: {})
    }

    let(:place_command) { instance_double(Commands::Place) }

    before { allow(Commands::Place).to receive(:new).and_return(place_command) }

    it "calls #execute on the next place command" do
      expect(place_command).to receive(:execute)

      command.execute
    end

    context "when robot is not placed" do
      let(:simulation) { instance_double(Simulation, robot_placed?: false) }

      it "doesn't call #execute on the next place command" do
	expect(place_command).not_to receive(:execute)

	command.execute
      end
    end
  end
end
