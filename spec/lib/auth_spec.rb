# frozen_string_literal: true

RSpec.describe Macros::Auth do
  describe '#Authenticate()' do
    it { expect(described_class::Authenticate()).to be_a described_class::Authenticate }
  end

  describe '#SignIn()' do
    it { expect(described_class::SignIn()).to be_a described_class::SignIn }
  end

  describe '#SignOut()' do
    it { expect(described_class::SignOut()).to be_a described_class::SignOut }
  end
end
