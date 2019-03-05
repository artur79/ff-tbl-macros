# frozen_string_literal: true

module Macros
  class UserScope
    class Model < Macros::Base
      # @return [Macro::UserScope::Model] step macro instance
      # @param condition [Hash] attribute the model should respond to as the condition to be set.
      # @example model should respond to :last_sign_in_at
      #   Macros::User::Scope(condition: :last_sign_in_at)
      # @example model should just exists
      #   Macros::User::Scope()
      def initialize(condition: nil)
        @condition = condition
      end

      # Sets the current user in the context
      # @param ctx [Trailblazer::Skill] tbl context hash
      def call(ctx, scope:, **)
        return false if scope.blank?
        klass = MakeClass.(scope)
        return false if @condition && !klass.new.respond_to?(@condition)
        ctx[:model] = klass.new
      end
    end
  end
end
