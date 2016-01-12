require 'spec_helper'

describe Robot do
  describe "#new" do
    subject { described_class.new }

    it { is_expected.to be_a(Robot) }
  end

  describe "#position" do
    it "returns a hash representation of the robot position" do
      robot = Robot.new
      robot.x_position = 2
      robot.orientation = :south_west

      expect(robot.position).to eq({
        x_position: 2,
        y_position: nil,
        orientation: :south_west
      })
    end
  end
end
