# frozen_string_literal: true

RSpec.describe Macros::Ctx::Copy do
  subject(:copy_step) { described_class.new(origin_key, destination_key) }

  let(:origin_key) { :foo }
  let(:destination_key) { :bar }
  let(:value) { :lorem }

  let(:ctx) { { origin_key => value } }

  it 'expects to copy origin value to destination one in ctx' do
    copy_step.call(ctx)

    expect(ctx[destination_key]).to eq value
  end

  context 'source key not present in ctx' do
    let(:ctx) { { dolor: :se } }

    it 'expects to keep destination value to be nil' do
      copy_step.call(ctx)

      expect(ctx[destination_key]).to be nil
    end
  end
end
