# frozen_string_literal: true

RSpec.describe Macros::Auth::ExpireSessionData do
  include Warden::Test::Mock

  subject(:step) { described_class.new }
  let(:ctx) { { warden: warden } }
  let(:session) { warden.session_serializer.session }

  before do
    warden.session_serializer.session[:lorem] = :ipsum
    warden.session_serializer.session['devise.lorem'] = :ipsum
  end

  it 'expects to clear devise related data from session' do
    step.call(ctx)

    expect(session[:lorem]).to eql :ipsum
    expect(session['devise.lorem']).to be nil
  end
end
