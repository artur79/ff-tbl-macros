# frozen_string_literal: true

RSpec.describe Macros::Auth::Authenticate do
  include Warden::Test::Mock

  subject(:authenticate_step) { described_class.new() }

  before do
    warden.set_user(user, scope: scope)
  end

  let(:user) { mock_model('User') }
  let(:scope) { :user }
  let(:ctx) { { } }

  it 'expects to authenticate' do
    authenticate_step.call(ctx, scope: scope, warden: warden)

    expect(ctx[:model]).to eql user
  end
end
