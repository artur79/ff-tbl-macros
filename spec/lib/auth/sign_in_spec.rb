# frozen_string_literal: true

RSpec.describe Macros::Auth::SignIn do
  include Warden::Test::Mock

  subject(:sign_in_step) { described_class.new }

  let(:user) { mock_model('User') }
  let(:scope) { :user }
  let(:ctx) { { model: user, warden: warden } }

  before do
    fake_class = Class.new
    dm = stub_const('Devise::Mapping', fake_class, transfer_nested_constants: true)
    allow(dm).to receive(:find_scope!).with(user).and_return(scope)
  end

  context 'user not signed in' do
    it 'expects to sign in' do
      sign_in_step.call(ctx, model: user, warden: warden)

      expect(ctx[:current_user]).to eql user
    end
  end

  context 'user already signed in' do
    before do
      warden.set_user(user, scope: scope)
    end

    it 'expects to keep user signed in' do
      sign_in_step.call(ctx, model: user, warden: warden)

      expect(ctx[:current_user]).to eql user
    end
  end
end
