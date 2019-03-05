# frozen_string_literal: true

module Macros
  class Model < Macros::Base
    register :copy
    register :find_or_build_from_association
    register :destroy
    register :persist
  end
end
