require_relative '../github'
require_relative '../github/pull_request'
require_relative '../github/reviewers'
require_relative '../github/comment'

module Lita
  module Handlers
    class ReviewerLotto < Handler
      http.post '/pull_requests/new', :new_pull_request

      def new_pull_request(request, _response)
        pull_request = Lita::Github::PullRequest.new(request)
        return if pull_request.open?

        reviewers = Lita::Github::Reviewers.new
        return if reviewers.empty?

        comment = Lita::Github::Comment.new(pull_request, reviewers)
        Lita::Github.add_comment(comment.repository,
                                 comment.number,
                                 comment.message)
      end

      Lita.register_handler(self)
    end
  end
end
