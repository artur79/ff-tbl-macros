# frozen_string_literal: true

RSpec.describe Macros::Model do
  let(:ctx_key) { :project }

  describe '#Build()' do
    it { expect(described_class::Build(from: ctx_key)).to be_a described_class::Build }
  end

  describe '#Copy()' do
    it { expect(described_class::Copy(ctx_key)).to be_a described_class::Copy }
  end

  describe '#Destroy()' do
    it { expect(described_class::Destroy()).to be_a described_class::Destroy }
  end

  describe '#Persist()' do
    it { expect(described_class::Persist(ctx_key: ctx_key)).to be_a described_class::Persist }
  end
end
