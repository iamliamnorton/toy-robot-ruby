require 'spec_helper'

describe Simulation do
  let(:simulation) { described_class.new }

  describe "#new" do
    subject { described_class.new }

    it { is_expected.to be_a(Simulation) }
  end

  describe "#table_position_available?" do
    it "returns true with valid arguments" do
      table_position_available = simulation.table_position_available?(
	x_position: 1,
	y_position: 2
      )

      expect(table_position_available).to eq(true)
    end

    it "returns false with an invalid x_position" do
      table_position_available = simulation.table_position_available?(
	x_position: -1,
	y_position: 2
      )

      expect(table_position_available).to eq(false)
    end

    it "returns false with an invalid y_position" do
      table_position_available = simulation.table_position_available?(
	x_position: 1,
	y_position: 'bob'
      )

      expect(table_position_available).to eq(false)
    end

    it "returns false with an missing y_position " do
      table_position_available = simulation.table_position_available?(
	x_position: 1,
	y_position: nil
      )

      expect(table_position_available).to eq(false)
    end
  end

  describe "#place_robot" do
    it "sets the robot x_position" do
      expect(simulation.robot).to receive(:x_position=).with(1)

      simulation.place_robot(x_position: 1, y_position: 2, orientation: Robot::EAST)
    end

    it "sets the robot y_position" do
      expect(simulation.robot).to receive(:y_position=).with(2)

      simulation.place_robot(x_position: 1, y_position: 2, orientation: Robot::EAST)
    end

    it "sets the robot orientation" do
      expect(simulation.robot).to receive(:orientation=).with(Robot::EAST)

      simulation.place_robot(x_position: 1, y_position: 2, orientation: Robot::EAST)
    end
  end
end
