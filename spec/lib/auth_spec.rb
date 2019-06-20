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

  describe '#SignOutAllScopes()' do
    it { expect(described_class::SignOutAllScopes()).to be_a described_class::SignOutAllScopes }
  end

  describe '#ExpireSessionData()' do
    it { expect(described_class::ExpireSessionData()).to be_a described_class::ExpireSessionData }
  end
end
