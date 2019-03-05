# frozen_string_literal: true

module Macros
  class UserScope
    class Validate < Macros::Base
      # Check if the scope is set in the context
      # @param ctx [Trailblazer::Skill] tbl context hash
      def call(ctx, **)
        # presence
        !!ctx[:scope]
        # TODO: check for valid values?
      end
    end
  end
end
