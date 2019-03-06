# frozen_string_literal: true

module Macros
  class Auth < Macros::Base
    register :authenticate
    register :sign_in
    register :sign_out
  end
end