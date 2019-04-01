# frozen_string_literal: true

RSpec.describe Macros::Search::Query do
  subject(:query_step) { described_class.new(searchable: klass) }

  let(:page) { 1 }
  let(:result) { double('result', page: page) }
  let(:ransack_result) { OpenStruct.new(q: query, result: result) }
  let(:klass) { mock_model('User', ransack: ransack_result) }

  let(:query) { { name_cont: 'foo' } }
  let(:params) { { q: query, page: page } }
  let(:ctx) { { params: params } }

  it 'expects to search' do
    expect(klass).to receive(:ransack).with(query)

    query_step.call(ctx, params: params)

    expect(ctx[:query].q).to eql query
    expect(ctx[:query].result).to eql result
  end
end
