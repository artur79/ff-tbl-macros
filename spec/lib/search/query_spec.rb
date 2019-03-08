# frozen_string_literal: true

RSpec.describe Macros::Search::Query do
  subject(:query_step) { described_class.new(searchable: klass) }

  let(:ransack_res) { RecursiveOpenStruct.new({ q: query, result: { page: 1 } }) }
  let(:klass) { mock_model('User', ransack: ransack_res) }

  let(:query) { { name_cont: 'foo' } }
  let(:page) { 1 }
  let(:params) { { q: query, page: page } }
  let(:ctx) { { params: params } }

  it 'expects to search' do
    query_step.call(ctx, params: params)

    expect(klass).to receive(:ransack).with(query) # TODO
  end
end
