# frozen_string_literal: true

module Macros
  class Search
    class Query < Macros::Base
      include Pagy::Backend

      # @return [Macros::Search::Results] step macro instance
      #
      # @example searchable is optional, paginate is true by default
      #   Macros::Search::Query(searchable: Admin)
      def initialize(searchable:, paginate: true)
        @searchable = searchable
        @paginate = paginate
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

        ransack_search = @searchable.ransack params[:q]
        ctx[:query] = ransack_search

        temp_search_results = ransack_search.result

        if @paginate
          page = params[:page] || 1
          pagy, records = pagy(temp_search_results, page: page)
          ctx[:pages] = pagy
          temp_search_results = records
        end

        ctx[:search_results] = order ? temp_search_results.order(order) : temp_search_results
      end
    end
  end
end
