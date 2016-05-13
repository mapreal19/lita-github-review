module Lita
  module Github
    class Comment
      attr_reader :repository,
                  :number,
                  :message

      def initialize(pull_request, reviewers)
        @repository = pull_request.repository
        @number = pull_request.number
        @message = build_message(reviewers)
      end

      private

      def build_message(reviewers)
        "#{reviewers} please review."
      end
    end
  end
end
