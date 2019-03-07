# frozen_string_literal: true

module Macros
  class Ctx
    class ValidatePresence < Macros::Base
      # Check if the key set in the context
      # @param key [Symbol]
      # @example key not passed
      #   Macros::Contract::ExtractParams()
      def initialize(key)
        @key = key
      end

      # @param ctx [Trailblazer::Skill] tbl context hash
      def call(ctx, **)
        !!ctx[@key]
      end
    end
  end
end
