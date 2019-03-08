# frozen_string_literal: true

module Macros
  class Model
    class Build < Macros::Base
      # @return [Macros::Model::Build] step macro instance
      # @param from [Hash] required attribute, key in the context to build model class from
      # @example
      #   Macros::Model::Build(from: :scope)
      # @param condition [Hash] attribute the model should respond to as the condition to be set.
      # @example model should respond to :last_sign_in_at
      #   Macros::Model::Build(from: :scope, respond_to: :last_sign_in_at)

      def initialize(from:, respond_to: nil)
        @from = from
        @respond_to = respond_to
      end

      # Sets the model in the context
      # @param ctx [Trailblazer::Skill] tbl context hash
      def call(ctx, **)
        scope = ctx[@from]
        return false unless scope
        klass = scope.to_s.classify.constantize
        return false if @respond_to && !klass.new.respond_to?(@respond_to)
        ctx[:model] = klass.new
      end
    end
  end
end
