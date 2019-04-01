# frozen_string_literal: true

module Macros
  class Auth
    # Authenticates the given user using warden. This code run at the rack level, and is tied to the request.
    #
    class Authenticate < Base
      # @return [Macro::Auth::SignIn] step macro instance
      def initialize; end

      # Performs a step by authenticating the the given user
      # @param ctx [Trailblazer::Skill] tbl context hash
      def call(ctx, scope:, warden:, **)
        user = warden.authenticate(scope: scope)
        if user
          ctx[:model] = user
          true
        else
          false
        end
      end
    end
  end
end
