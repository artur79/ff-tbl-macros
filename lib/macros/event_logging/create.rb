# frozen_string_literal: true

module Macros
  class EventLogging
    class Create < Macros::Base
      def initialize(ctx_key: :model)
        @ctx_key = ctx_key
      end

      def call(ctx, **)
        record = ctx[@ctx_key]
        return false unless record

        actor = ctx[:actor] || ctx[:current_user]
        extra_metadata = ctx[:extra_metadata] || {}

        FirefieldEventStore::DefaultEvents::CreateDbRecord.call record: model, actor_id: actor.id, actor_type: actor.class.name, extra_metadata: extra_metadata
      end
    end
  end
end
