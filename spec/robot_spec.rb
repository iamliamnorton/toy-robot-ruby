require 'spec_helper'

describe Robot do
  describe "#new" do
    subject { described_class.new }

    it { is_expected.to be_a(Robot) }
  end
end
