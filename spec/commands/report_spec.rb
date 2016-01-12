require 'spec_helper'

describe Commands::Report do
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
    subject(:execute) { command.execute }

    context "when the robot is placed" do
      let(:simulation) {
        instance_double(
          Simulation,
          robot_placed?: true,
          current_robot_position: {
            x_position: 1,
            y_position: 2,
            orientation: Robot::EAST,
          }
        )
      }

      it "output the robot position to STDOUT" do
        expect(STDOUT).to receive(:puts).with("1,2,EAST")

        execute
      end
    end

    context "when robot is not placed" do
      let(:simulation) { instance_double(Simulation, robot_placed?: false) }

      it "doesn't output anything" do
        expect(STDOUT).not_to receive(:puts)

        execute
      end
    end
  end
end
