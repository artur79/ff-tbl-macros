# frozen_string_literal: true

module Macros
  class Contract
    class Prepopulate < Macros::Base
      def initialize(options_key: nil)
        @options_key = options_key
      end

      def call(ctx, **)
        options = ctx[@options_key] || {}

        ctx['contract.default'].prepopulate!(options)
      end
    end
  end
end
