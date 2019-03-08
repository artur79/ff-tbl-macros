# frozen_string_literal: true

RSpec.describe Macros::CurrentUser do
  describe '#Set()' do
    it { expect(described_class::Set()).to be_a described_class::Set }
  end
end
