require 'spec_helper'

describe Client do
  describe "#new" do
    subject { described_class.new }

    it { is_expected.to be_a(Client) }
  end

  describe "#start" do
    context "for first acceptance critera" do
      let(:input) {
        [
          "PLACE 0,0,NORTH",
          "MOVE",
          "REPORT",
        ].join("\n")
      }

      it "outputs correctly to STDOUT" do
        expect { Client.new(input: input).start }.to output("0,1,NORTH\n").to_stdout
      end
    end

    context "for second acceptance critera" do
      let(:input) {
        [
          "PLACE 0,0,NORTH",
          "LEFT",
          "REPORT",
        ].join("\n")
      }

      it "outputs correctly to STDOUT" do
        expect { Client.new(input: input).start }.to output("0,0,WEST\n").to_stdout
      end
    end

    context "for third acceptance critera" do
      let(:input) {
        [
          "PLACE 1,2,EAST",
          "MOVE",
          "MOVE",
          "LEFT",
          "MOVE",
          "REPORT",
        ].join("\n")
      }

      it "outputs correctly to STDOUT" do
        expect { Client.new(input: input).start }.to output("3,3,NORTH\n").to_stdout
      end
    end
  end
end
