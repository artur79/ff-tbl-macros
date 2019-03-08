# frozen_string_literal: true

module Macros
  class Model < Macros::Base
    register :build
    register :copy
    register :destroy
    register :persist
  end
end
