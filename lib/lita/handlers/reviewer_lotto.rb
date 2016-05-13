require_relative '../github/new_pull_request'

module Lita
  module Handlers
    class ReviewerLotto < Handler
      PR_ROUTE = '/pull_requests/new'.freeze

      config :reviewers

      http.post PR_ROUTE, :new_pull_request

      def new_pull_request(request, _response)
        Lita::Github::NewPullRequest.call(request)
      end

      Lita.register_handler(self)
    end
  end
end
