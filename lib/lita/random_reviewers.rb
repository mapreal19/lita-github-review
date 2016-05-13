module Lita
  module RandomReviewers
    class << self
      def get(reviewers)
        reviewers.to_a.sample(2)
      end
    end
  end
end
