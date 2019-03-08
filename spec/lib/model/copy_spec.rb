# frozen_string_literal: true

RSpec.describe Macros::Model::Copy do
  let(:user) { mock_model('User') }

  let(:ctx) { { current_user: user } }
  let(:ctx_key) { :current_user }

  subject(:copy_step) { described_class.new(ctx_key) }

  it 'expects to copy current user to ctx model' do
    copy_step.call(ctx)

    expect(ctx[:model]).to eq user
  end

  context 'source does not exist' do
    let(:ctx_key) { :administrator }

    it 'expects ctx model to keep nil' do
      copy_step.call(ctx)

      expect(ctx[:model]).to be nil
    end
  end
end
