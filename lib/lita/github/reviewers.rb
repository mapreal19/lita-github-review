require_relative '../random_reviewers'

module Lita
  module Github
    class Reviewers
      PREFIX = '+@'.freeze
      SEPARATOR = ', '.freeze

      def initialize
        @collection = RandomReviewers.get(pool)
      end

      def present?
        !@collection.empty?
      end

      def to_s
        @collection.map { |reviewer| formatted(reviewer) }.join(SEPARATOR)
      end

      private

      def pool
        Lita.config.handlers.reviewer_lotto.reviewers
      end

      def formatted(reviewer)
        "#{PREFIX}#{reviewer}"
      end
    end
  end
end
