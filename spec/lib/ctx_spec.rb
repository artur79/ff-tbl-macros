# frozen_string_literal: true

RSpec.describe Macros::Ctx do
  let(:key) { :lorem }

  describe '#Copy()' do
    let(:destination_key) { :bar }

    it { expect(described_class::Copy(key, destination_key)).to be_a described_class::Copy }
  end

  describe '#Inspect()' do
    it { expect(described_class::Inspect(key: key)).to be_a described_class::Inspect }
  end

  describe '#ValidatePresence()' do
    it { expect(described_class::ValidatePresence(key: key)).to be_a described_class::ValidatePresence }
  end
end
