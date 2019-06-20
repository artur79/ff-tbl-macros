# frozen_string_literal: true

RSpec.describe Macros::Auth::SignOutAllScopes do
  include Warden::Test::Mock

  subject(:step) { described_class.new(params) }
  let(:params) { {} }

  let(:user) { mock_model('User') }
  let(:foo_user) { mock_model('FooUser') }
  let(:admin) { mock_model('Admin') }

  let(:ctx) { { warden: warden } }

  before do
    devise = class_double('Devise').as_stubbed_const
    allow(devise).to receive_message_chain(:mappings, :keys).and_return([:user, :foo_user, :admin])

    warden.set_user(foo_user, scope: :foo_user)
    warden.set_user(admin, scope: :admin)
  end

  it 'expects to sign out all users' do
    step.call(ctx)

    expect(warden.authenticated?(:user)).to be false
    expect(warden.authenticated?(:foo_user)).to be false
    expect(warden.authenticated?(:admin)).to be false
  end

  context 'except param passed' do
    let(:params) { { except: :admin } }

    it 'expects to sign out all users except admin' do
      step.call(ctx)

      expect(warden.authenticated?(:user)).to be false
      expect(warden.authenticated?(:foo_user)).to be false
      expect(warden.authenticated?(:admin)).to be true
    end
  end
end
