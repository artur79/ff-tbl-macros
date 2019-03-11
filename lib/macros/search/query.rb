# frozen_string_literal: true

module Macros
  class Search
    class Query < Macros::Base
      # @return [Macros::Search::Results] step macro instance
      #
      # @example searchable is optional
      #   Macros::Search::Query(searchable: Admin)
      def initialize(searchable:)
        @searchable = searchable
      end

      # @param ctx [Trailblazer::Skill] tbl context hash
      #
      # The search params are passed in ctx[:params] and look like this:
      # `{q: 'the query', page: 2}`
      #
      # The orders is passed in ctx[:order] and looks like this:
      # `{created_at: :desc}`
      def call(ctx, params:, order: nil, **)
        return false unless @searchable

        ctx[:searchable] = @searchable
        ransack_search_result = @searchable.ransack params[:q]
        ctx[:query] = ransack_search_result

        temp_search_results = ransack_search_result.result
        search_results = order ? temp_search_results.order(order) : temp_search_results
        ctx[:search_results] = search_results.page params[:page]
      end
    end
  end
end
