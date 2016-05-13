require_relative '../random_reviewers'

module Lita
  module Github
    class Reviewers
      PREFIX = '+@'.freeze
      SEPARATOR = ', '.freeze

      def initialize
        @collection = RandomReviewers.get
      end

      def empty?
        @collection.empty?
      end

      def to_s
        @collection.map { |reviewer| formatted(reviewer) }.join(SEPARATOR)
      end

      def formatted(reviewer)
        "#{PREFIX}#{reviewer}"
      end
    end
  end
end
