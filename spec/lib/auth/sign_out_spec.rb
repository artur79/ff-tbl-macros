# frozen_string_literal: true

RSpec.describe Macros::Auth::SignOut do
  include Warden::Test::Mock

  subject(:sign_out_step) { described_class.new() }

  let(:user) { mock_model('User') }
  let(:scope) { :user }
  let(:ctx) { { warden: warden } }

  before do
    fake_class = Class.new
    dm = stub_const('Devise::Mapping', fake_class, transfer_nested_constants: true)
    allow(dm).to receive(:find_scope!).with(scope).and_return(scope)
  end

  context 'user signed in' do
    before do
      warden.set_user(user, scope: scope)
    end

    it 'expects to sign out user' do
      sign_out_step.call(ctx, warden: warden)

      expect(ctx[:current_user]).to be nil
    end
  end

  context 'user not signed in' do
    it 'expects to keep user signed out' do
      sign_out_step.call(ctx, warden: warden)

      expect(ctx[:current_user]).to be nil
    end
  end
end
