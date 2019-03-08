# frozen_string_literal: true

RSpec.describe Macros::Contract::ExtractParams do
  subject(:extract_params_step) { described_class.new() }

  class self::UserForm < Reform::Form
    property :password

    def build_errors; end
  end

  let(:user) { stub_model(User) }
  let(:contract) { self.class::UserForm.new(user) }
  let(:scope) { :user }
  let(:password) { '$3cr3t' }
  let(:ctx) { { scope: scope, params: { user: { password: password } } } }

  it 'expects to set params in contract' do
    extract_params_step.call(ctx)

    expect(ctx['contract.default.params'][:password]).to eql password
  end
end
