# frozen_string_literal: true

RSpec.describe Macros::Search do
  describe '#Query()' do
    let(:searchable) { :admin }

    it { expect(described_class::Query(searchable: searchable)).to be_a described_class::Query }
  end
end
