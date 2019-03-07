# frozen_string_literal: true

module Macros
  class Contract
    class ExtractParams < Macros::Base
      # @return [Macros::Contract::ExtractParams] step macro instance
      # @param key [Symbol] key in params default is scope
      # @example scope not passed
      #   Macros::Contract::ExtractParams()
      # @example scope passed
      #   Macros::Contract::ExtractParams(scope: :admin)

      def initialize(scope: :user)
        @scope = scope
      end

      def call(ctx, **)
        return false unless ctx[:params]

        ctx['contract.default.params'] = ctx[:params][@scope]
      end
    end
  end
end
