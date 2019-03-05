# frozen_string_literal: true

module Macros
  class Auth
    # Sign in the given user. The user is passed in ctx[:model].
    #
    class SignIn < Macros::Base
      # @return [Macro::Auth::SignIn] step macro instance
      def initialize(condition: nil)
        @condition = condition
      end

      # Performs a step by signing in the given user
      # @param ctx [Trailblazer::Skill] tbl context hash
      def call(ctx, model:, warden:, **)
        return false if @condition && ctx[@condition].blank?

        options = ctx[:sign_in_options] || {}
        scope = Devise::Mapping.find_scope!(model)
        expire_data_after_sign_in(session: warden.session_serializer.session)

        if warden.user(scope) == model && !options.delete(:force)
          # Do nothing. User already signed in and we are not forcing it.
          true
        else
          options[:scope] = scope
          warden.set_user(model, options)
        end

        ctx[:current_user] = model
        true
      end

      def expire_data_after_sign_in(session:)
        # session.keys will return an empty array if the session is not yet loaded.
        # This is a bug in both Rack and Rails.
        # A call to #empty? forces the session to be loaded.
        session.empty?
        session.keys.grep(/^devise\./).each { |k| session.delete(k) }
      end
    end
  end
end
