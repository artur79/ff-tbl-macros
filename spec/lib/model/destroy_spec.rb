# frozen_string_literal: true

RSpec.describe Macros::Model::Destroy do
  subject(:destroy_step) { described_class.new }

  let(:ctx) { { model: user } }
  let(:user) { mock_model('User', destroy: true, destroyed?: true) }

  it 'expect to destroy model' do
    destroy_step.call(ctx, model: user)
    expect(ctx[:model].destroyed?).to be true
  end
end
