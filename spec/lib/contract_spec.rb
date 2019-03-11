# frozen_string_literal: true

RSpec.describe Macros::Contract do
  describe '#Prepopulate()' do
    let(:options_key) { :foo }

    it { expect(described_class::Prepopulate(options_key: options_key)).to be_a described_class::Prepopulate }
  end

  describe '#ExtractParams()' do
    let(:from) { :scope }
    it { expect(described_class::ExtractParams(from: from)).to be_a described_class::ExtractParams }
  end
end
