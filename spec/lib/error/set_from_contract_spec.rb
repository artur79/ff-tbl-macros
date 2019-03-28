# frozen_string_literal: true

RSpec.describe Macros::Error::SetFromContract do
  subject(:step) { described_class.new }

  let(:ctx) do
    { 'contract.default' => RecursiveOpenStruct.new(errors: { messages: { email: ["can't be blank"] } }) }
  end

  it 'should set error messages in context' do
    result = step.call(ctx)

    expect(result).to be true
    expect(ctx[:error_messages][:email]).to include "can't be blank"
  end

  context 'contract errors not set' do
    let(:ctx) { { 'contract.default' => RecursiveOpenStruct.new } }

    it 'should not set any error messages' do
      result = step.call(ctx)

      expect(result).to be false
      expect(ctx[:error_messages]).to be nil
    end
  end
end
