# frozen_string_literal: true

module Macros
  class CurrentUser
    VALID_CURRENT_USER_CLASS_NAMES = %w(User Admin)

    # Sets the current_user in the context.
    #
    class Set < Macros::Base
      # @return [Macro::CurrentUser::Set] step macro instance
      def initialize(key: :model)
        @key = key
      end

      # Sets the current user in the context
      # @param ctx [Trailblazer::Skill] tbl context hash
      def call(ctx, **)
        return false unless ctx[@key]
        return false unless VALID_CURRENT_USER_CLASS_NAMES.include? ctx[@key].class.name.demodulize

        ctx[:current_user] = ctx[@key]
      end
    end
  end
end
