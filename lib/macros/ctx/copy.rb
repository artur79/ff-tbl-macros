# frozen_string_literal: true

module Macros
  class Ctx
    class Copy < Macros::Base
      def initialize(origin_key, destination_key)
        @origin_key = origin_key
        @destination_key = destination_key
      end

      def call(ctx, **)
        return false if ctx[@origin_key].blank?
        ctx[@destination_key] = ctx[@origin_key]
      end
    end
  end
end
