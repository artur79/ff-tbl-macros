# frozen_string_literal: true

module Macros
  class Ctx
    # Prints the entire tbl context or just a single resource
    #
    # @example prints the entire tbl context
    #   step Macros::Ctx::Inspect()
    #
    # @example prints the :model resource from the tbl context
    #   step Macros::Ctx::Inspect(:model)
    class Inspect < Macros::Base
      # @return [Macros::Debug::Ctx] step macro instance
      # @param key [Symbol or String] ctx key under which is a resource to which we want to assign, optional
      def initialize(key: nil)
        @key = key
      end

      def call(ctx, **)
        if @key
          p ctx[@key]
        else
          p ctx
        end
        true
      end
    end
  end
end
