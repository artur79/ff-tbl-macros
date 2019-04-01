# frozen_string_literal: true

RSpec.describe Macros::Contract::ExtractParams do
  subject(:extract_params_step) { described_class.new(params) }

  let(:params) { { from: from } }

  class self::UserForm < Reform::Form # rubocop:disable Style/ClassAndModuleChildren
    property :password

    def build_errors; end
  end

  let(:user) { stub_model(User) }
  let(:contract) { self.class::UserForm.new(user) }
  let(:scope) { :user }
  let(:password) { '$3cr3t' }
  let(:from) { :scope }
  let(:ctx) { { scope: :user, params: { user: { password: password } } } }

  it 'expects to set params in contract' do
    extract_params_step.call(ctx, params: params)

    expect(ctx['contract.default.params'][:password]).to eql password
  end

  context 'from key does not exist' do
    let(:from) { :scoped_to }

    it 'expects to fail and do not set any params in contract' do
      expect(extract_params_step.call(ctx, params: params)).to eql false
      expect(ctx['contract.default.params']).to be nil
    end
  end
end
