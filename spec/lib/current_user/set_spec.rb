# frozen_string_literal: true

RSpec.describe Macros::CurrentUser::Set do
  subject(:set_step) { described_class.new() }

  let(:user) { mock_model('User') }
  let(:ctx) { { model: user } }

  it 'should set current user in ctx' do
    set_step.call(ctx)

    expect(ctx[:current_user]).to eql user
  end

  context 'model key does not exists in the context' do
    let(:ctx) { { admin: user } }

    it 'should not set current user in ctx' do
      set_step.call(ctx)

      expect(ctx[:current_user]).to be nil
    end
  end
end
