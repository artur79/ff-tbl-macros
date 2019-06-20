# frozen_string_literal: true

module Macros
  class Auth
    # Sign out users of all scopes
    #
    # @example
    #   step Macros::Auth::SignOutAllScopes()
    #
    # @example specify scopes to skip sign out from
    #   step Macros::Auth::SignOutAllScopes(except: [:admin])
    class SignOutAllScopes < Macros::Base
      # @return [Macros::Auth::SignOutAllScopes] step macro instance
      # @param expect [Array] list of scopes to skip sign out
      def initialize(except: [])
        @except = except.is_a?(Array) ? except : [except]
      end

      # Performs a step by sign out users
      # @param ctx [Trailblazer::Skill] tbl context hash
      def call(ctx, **)
        warden = ctx[:warden]

        if @except.empty?
          warden.logout
        else
          (Devise.mappings.keys - @except).each do |scope|
            warden.logout(scope) if warden.authenticated?(scope: scope)
          end
        end

        Macros::Auth::ExpireSessionData.new.call(ctx)
        warden.clear_strategies_cache!
        warden.lock!
      end
    end
  end
end
