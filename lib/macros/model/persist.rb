# frozen_string_literal: true

module Macros
  class Model
    # Persist object from the context
    # @example
    #   step Macros::Model::Persist(ctx_key: :weekly_plan_editing)
    class Persist < Macros::Base
      def initialize(ctx_key: :model)
        @ctx_key = ctx_key
      end

      def call(ctx, **)
        return false if ctx[@ctx_key].blank?

        ctx[@ctx_key].save!
      end
    end
  end
end
