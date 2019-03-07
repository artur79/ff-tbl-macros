# frozen_string_literal: true

module Macros
  class VerifyParams
    class Date < Macros::Base
      def initialize(params_key: :date)
        @params_key = params_key
      end

      def call(ctx, **) # TODO for some reason using params: here makes specs to return missing keyword: params
        return false unless ctx[:params]

        ctx[:params][@params_key].class == ::Date
      end
    end
  end
end
