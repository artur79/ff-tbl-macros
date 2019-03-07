# frozen_string_literal: true

module Macros
  class Contract
    class ExtractParams < Macros::Base
      # @return [Macros::Contract::ExtractParams] step macro instance
      # @param key [Symbol] key in params default is scope
      # @example key not passed
      #   Macros::Contract::ExtractParams()
      # @example key passed
      #   Macros::Contract::ExtractParams(:admin)

      def initialize(key = :scope)
        @key = key
      end

      def call(ctx, **)
        return false unless ctx[:params]

        ctx['contract.default.params'] = ctx[:params][@key]
      end
    end
  end
end
