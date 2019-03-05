# frozen_string_literal: true

module Macros
  class Model
    class Copy < Macros::Base
      def initialize(ctx_key=nil)
        @ctx_key = ctx_key
      end

      def call(ctx, **)
        return false if ctx[@ctx_key].blank?
        ctx[:model] = ctx[@ctx_key]
      end
    end
  end
end
