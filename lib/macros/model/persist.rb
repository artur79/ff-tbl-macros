# frozen_string_literal: true

module Macros
  class Model
    # Persist object from the context
    # @example
    #   step Macros::Model::Persist(ctx_key: :weekly_plan_editing)
    class Persist < Macros::Base
      def initialize(ctx_key: :model, method: :save!)
        @ctx_key = ctx_key
        @method = method
      end

      def call(ctx, **)
        return false unless ctx[@ctx_key]

        ctx[@ctx_key].public_send(@method)
      end
    end
  end
end
