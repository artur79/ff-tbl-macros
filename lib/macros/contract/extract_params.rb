# frozen_string_literal: true

module Macros
  class Contract
    class ExtractParams < Macros::Base
      # @return [Macros::Contract::ExtractParams] step macro instance
      # @param from [Hash] key in params
      # @example scope not passed
      #   Macros::Contract::ExtractParams(from: :scope)

      def initialize(from:)
        @from = from
      end

      def call(ctx, **)
        return false unless ctx[:params]

        scope = ctx[@from]
        return false unless scope

        ctx['contract.default.params'] = ctx[:params][scope]
      end
    end
  end
end
