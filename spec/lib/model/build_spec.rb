# frozen_string_literal: true

RSpec.describe Macros::Model::Build do
  subject(:build_step) { described_class.new(params) }

  let(:params) { { from: from } }
  let(:scope) { :foobar }
  let(:from) { :scope }
  let(:ctx) { { scope: scope } }

  before do
    mock_model('Foobar')
  end

  it 'should build model' do
    build_step.call(ctx)

    expect(ctx[:model].class.name).to eql 'Foobar'
  end

  context 'respond to passed in params' do
    let(:params) { { from: from, respond_to: :loremised_by_id } }

    context 'model responds to specified method' do
      before do
        allow_any_instance_of(Foobar).to receive(:loremised_by_id).and_return(rand)
      end

      it 'should build model' do
        build_step.call(ctx)

        expect(ctx[:model].class).to eql Foobar
      end
    end

    context 'model do not respond to specified method' do
      it 'should fail' do
        expect(build_step.call(ctx)).to be false

        expect(ctx[:model]).to be nil
      end
    end
  end

  context 'key does not exist in ctx' do
    let(:ctx) { {} }

    it 'should fail' do
      expect(build_step.call(ctx)).to be false
      expect(ctx[:model]).to be nil
    end
  end
end
