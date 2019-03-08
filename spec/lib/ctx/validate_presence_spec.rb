# frozen_string_literal: true

RSpec.describe Macros::Ctx::ValidatePresence do
  subject(:validate_presence_step) { described_class.new(key) }

  let(:key) { :foo }
  let(:ctx) { { foo: 'Lorem' } }

  it 'expects to pass' do
    expect(validate_presence_step.call(ctx)).to be true
  end

  context 'key does not exist' do
    let(:key) { :bar }

    it 'expects to fail' do
      expect(validate_presence_step.call(ctx)).to be false
    end
  end
end
