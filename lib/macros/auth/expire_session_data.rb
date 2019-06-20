# frozen_string_literal: true

module Macros
  class Auth
    # Expire session data
    # Macro is used in other Devise' related macros because of the bug
    # https://github.com/plataformatec/devise/blob/master/lib/devise/controllers/sign_in_out.rb#L108
    #
    # @example
    #   step Macros::Auth::ExpireSessionData()
    #
    class ExpireSessionData < Macros::Base
      # @return [Macros::Auth::ExpireSessionData] step macro instance
      def initialize; end

      # @param ctx [Trailblazer::Skill] tbl context hash
      def call(ctx, **)
        session = ctx[:warden].session_serializer.session

        session.empty?
        session.keys.grep(/^devise\./).each { |k| session.delete(k) }
      end
    end
  end
end
