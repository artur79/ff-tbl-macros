# frozen_string_literal: true

module Macros
  class Error
    # Set error messages in the context using contract errors
    #
    # @example
    #   step Macros::Error::SetFromContract
    class SetFromContract < Macros::Base
      def call(ctx, **)
        error_messages = ctx['contract.default']&.errors&.messages
        return false unless error_messages

        ctx[:error_messages] = error_messages
        !!ctx[:error_messages]
      end
    end
  end
end
