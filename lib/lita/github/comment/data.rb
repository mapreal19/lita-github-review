module Lita
  module Github
    class Comment
      class Data
        attr_reader :reviewers

        def initialize(request)
          @pull_request = PullRequest.new(request)
          @reviewers = Reviewers.new(@pull_request.author)
        end

        def invalid?
          !valid?
        end

        def repository
          @pull_request.repository
        end

        def number
          @pull_request.number
        end

        private

        def valid?
          @pull_request.open? && @reviewers.present?
        end
      end
    end
  end
end
