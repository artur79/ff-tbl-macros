# frozen_string_literal: true

module Macros
  class Auth < Macros::Base
    register :authenticate
    register :sign_in
    register :sign_out
    register :sign_out_all_scopes
    register :expire_session_data
  end
end
