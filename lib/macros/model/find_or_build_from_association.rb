# frozen_string_literal: true

module Macros
  class Model
    class FindOrBuildFromAssociation < Macros::Base
      # @example
      #   Macros::Model::FindOrBuildFromAssociation(belongs_to_key: :current_user, association_name: :working_hours_set)
      def initialize(belongs_to_key:, association_name:)
        @association_name = association_name
        @belongs_to_key = belongs_to_key
      end

      # finds model for the given association name
      # if not found builds record
      def call(ctx, **)
        belongs_to_model = ctx[@belongs_to_key]
        return false unless belongs_to_model

        association = belongs_to_model.public_send(@association_name)
        association ||= belongs_to_model.public_send("build_#{@association_name}".to_sym)

        ctx[:model] = association
      end
    end
  end
end
