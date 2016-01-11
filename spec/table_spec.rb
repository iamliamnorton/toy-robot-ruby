require 'spec_helper'

describe Table do
  describe "#new" do
    subject { described_class.new }

    it { is_expected.to be_a(Table) }
  end
end
