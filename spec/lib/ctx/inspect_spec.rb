# frozen_string_literal: true

RSpec.describe Macros::Ctx::Inspect do
  subject(:inspect_step) { described_class.new(key: key) }

  let(:key) { :foo }
  let(:value) { { lorem: :ipsum } }

  let(:ctx) { { foo: value, dolor: :se } }

  it 'expects to print only specified pair key and value' do
    inspect_step.call(ctx)

    expect { print(key => value) }.to output.to_stdout
  end

  context 'key not passed' do
    let(:key) { nil }

    it 'expects to print whole ctx' do
      inspect_step.call(ctx)

      expect { print(ctx) }.to output.to_stdout
    end
  end
end
