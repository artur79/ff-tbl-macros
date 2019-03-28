# frozen_string_literal: true

RSpec.describe Macros::Error do
  describe '#SetFromContract()' do
    it { expect(described_class::SetFromContract()).to be_a described_class::SetFromContract }
  end
end
