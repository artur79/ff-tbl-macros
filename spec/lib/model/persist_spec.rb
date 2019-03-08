# frozen_string_literal: true

RSpec.describe Macros::Model::Persist do
  let(:user) { mock_model('User', save!: true, save: true) }
  let(:ctx) { { model: user } }

  describe 'default save!' do
    subject(:persist_step) { described_class.new }

    it 'expect to save model' do
      expect(user).to receive(:save!)
      persist_step.call(ctx)
    end

    context 'ctx key is not default one' do
      subject(:persist_step) { described_class.new(ctx_key: ctx_key) }
      let(:project) { mock_model('Project', save!: true, save: true) }
      let(:ctx_key) { :project }
      let(:ctx) { { project: project } }

      it 'expect to save model' do
        expect(project).to receive(:save!)
        persist_step.call(ctx)
      end
    end

    context 'model is not present in context' do
      let(:ctx) { { foo: :bar } }

      it 'expect not to save model' do
        expect(user).not_to receive(:save!)
        persist_step.call(ctx)
      end
    end
  end

  describe 'different save method' do
    subject(:persist_step) { described_class.new(method: :save) }

    it 'expect to save model' do
      expect(user).to receive(:save)
      persist_step.call(ctx)
    end
  end
end
