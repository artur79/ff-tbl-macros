# frozen_string_literal: true

RSpec.describe Macros::Contract::Prepopulate do
  subject(:prepopulate_step) { described_class.new(options_key: options_key) }

  class self::AlbumForm < Reform::Form # rubocop:disable Style/ClassAndModuleChildren
    property :title

    def build_errors; end
  end

  let(:album) { mock_model('Album', title: title) }
  let(:contract) { self.class::AlbumForm.new(album) }

  let(:ctx) { { 'contract.default' => contract, options_key => { title: new_title } } }

  let(:options_key) { :params }

  let(:title) { 'Lorem' }
  let(:new_title) { 'Ipsum' }

  it 'expects to prepopulate contract' do
    expect(ctx['contract.default']).to receive(:prepopulate!).with(title: new_title)

    prepopulate_step.call(ctx)
  end
end
