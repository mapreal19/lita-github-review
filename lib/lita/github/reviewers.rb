require_relative '../random_reviewers'

module Lita
  module Github
    class Reviewers
      PREFIX = '+@'.freeze
      SEPARATOR = ', '.freeze

      def initialize(author)
        @collection = RandomReviewers.get(reviewers(author))
      end

      def present?
        !@collection.empty?
      end

      def to_s
        @collection.map { |reviewer| formatted(reviewer) }.join(SEPARATOR)
      end

      private

      def reviewers(author)
        pool - [author]
      end

      def pool
        Lita.config.handlers.github_review.reviewers
      end

      def formatted(reviewer)
        "#{PREFIX}#{reviewer}"
      end
    end
  end
end
