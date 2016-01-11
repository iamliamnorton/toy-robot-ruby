require 'spec_helper'

describe Simulation do
  let(:simulation) { described_class.new }

  describe "#new" do
    subject { described_class.new }

    it { is_expected.to be_a(Simulation) }
  end
end
