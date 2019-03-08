# frozen_string_literal: true

RSpec.describe Macros::VerifyParams do
  describe '#Date()' do
    let(:params_key) { :date }

    it { expect(described_class::Date(params_key: params_key)).to be_a described_class::Date }
  end
end
