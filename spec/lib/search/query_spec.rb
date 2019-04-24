# frozen_string_literal: true

RSpec.describe Macros::Search::Query do
  subject(:query_step) { described_class.new(macro_params) }
  let(:macro_params) { { searchable: klass, paginate: false } }
  let(:params) { { q: query, page: page } }
  let(:ctx) { { params: params } }
  let(:query) { { name_cont: 'foo' } }

  let(:result) { double('result', page: page) }
  let(:ransack_search) { double('Ransack::Search', result: [user1, user2]) }
  let(:klass) { mock_model('User', ransack: ransack_search) }

  let(:user1) { double('User') }
  let(:user2) { double('User') }
  let(:records) { [user1, user2] }

  describe 'search without paginate' do
    let(:paginate) { false }
    let(:page) { nil }

    it 'returns records without pagy' do
      expect(klass).to receive(:ransack).with(query).and_return(ransack_search)
      expect(ransack_search).to receive(:result).and_return(records)
      expect(subject).not_to receive(:pagy)

      query_step.call(ctx, params: params)

      expect(ctx[:search_results]).to eql records
      expect(ctx[:pages]).to be nil
      expect(ctx[:query]).to eql ransack_search
    end
  end

  describe 'search with paginate' do
    let(:macro_params) { { searchable: klass, paginate: true } }
    let(:paginate) { true }
    let(:page) { 1 }
    let(:pagy) { double('pagy') }

    it 'returns records with pagy' do
      expect(klass).to receive(:ransack).with(query).and_return(ransack_search)
      expect(ransack_search).to receive(:result).and_return(records)
      expect(subject).to receive(:pagy).with(records, page: 1).and_return([pagy, records])

      query_step.call(ctx, params: params)

      expect(ctx[:search_results]).to eql records
      expect(ctx[:pages]).to eql pagy
      expect(ctx[:query]).to eql ransack_search
    end
  end
end
