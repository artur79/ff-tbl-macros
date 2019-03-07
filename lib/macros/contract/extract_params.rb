# frozen_string_literal: true

module Macros
  class Contract
    class ExtractParams < Macros::Base
      # @return [Macros::Contract::ExtractParams] step macro instance
      # @param key [Symbol] key in params default is scope
      # @example scope not passed
      #   Macros::Contract::ExtractParams()

      def initialize(scope_key: :scope)
        @scope_key = scope_key
      end

      def call(ctx, **)
        return false unless ctx[:params]
        scope = ctx[@scope_key]
        return false unless scope

        ctx['contract.default.params'] = ctx[:params][scope]
      end
    end
  end
end
