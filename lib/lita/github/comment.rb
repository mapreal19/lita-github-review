module Lita
  module Github
    class Comment
      attr_reader :repository,
                  :number,
                  :message

      def initialize(comment_data)
        @repository = comment_data.repository
        @number = comment_data.number
        @message = build_message(comment_data.reviewers)
      end

      private

      def build_message(reviewers)
        "#{reviewers} please review."
      end
    end
  end
end
