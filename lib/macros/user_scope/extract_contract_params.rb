# TODO: this should be Macros::Contract::ExtractParams(:key)
# frozen_string_literal: true

module Macros
  class UserScope
    class ExtractContractParams < Macros::Base
      # @param ctx [Trailblazer::Skill] tbl context hash
      def call(ctx, scope:, params:, **)
        ctx['contract.default.params'] = params[scope]
      end
    end
  end
end
