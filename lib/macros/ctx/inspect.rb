# frozen_string_literal: true

module Macros
  class Ctx
    # Prints the entire tbl context or just a single resource
    #
    # @example prints the entire tbl context
    #   step Macros::Ctx::Inspect()
    #
    # @example prints the :model resource from the tbl context
    #   step Macros::Ctx::Inspect(key: :model)
    class Inspect < Macros::Base
      # @return [Macros::Debug::Ctx] step macro instance
      # @param key [Symbol or String] ctx key under which is a resource to which we want to assign, optional
      def initialize(key: nil)
        @key = key
      end

      def call(ctx, **)
        if @key
          p ctx[@key] # rubocop:disable Rails/Output
        else
          p ctx # rubocop:disable Rails/Output
        end
      end
    end
  end
end
