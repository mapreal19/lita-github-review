require_relative '../github'
require_relative '../github/pull_request'

module Lita
  module Handlers
    class ReviewerLotto < Handler
      Lita.register_handler(self)

      http.post '/pull_requests/new', :new_pull_request

      def new_pull_request(request, _response)
        pull_request = Lita::Github::PullRequest.new(request)
        return if pull_request.open?

        Lita::Github.add_comment(pull_request.repository,
                                 pull_request.number,
                                 'Hola Ramon')
      end
    end
  end
end
