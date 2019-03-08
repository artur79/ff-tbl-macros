# frozen_string_literal: true

RSpec.describe Macros::VerifyParams::Date do
  subject(:date_step) { described_class.new(params_key: params_key) }

  let(:params_key) { :date }

  let(:date) { Date.parse('2019-01-15') }
  let(:ctx) { { params: { date: date } } }

  it 'expects to pass' do
    expect(date_step.call(ctx)).to be true
  end

  context 'date invalid' do
    let(:date) { '2018' }

    it 'expects to fail' do
      expect(date_step.call(ctx)).to be false
    end
  end
end
