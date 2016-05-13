require_relative 'pull_request'
require_relative 'reviewers'
require_relative 'comment'
require_relative 'comment/data'

module Lita
  module Github
    module NewPullRequest
      class << self
        def call(request)
          comment_data = Comment::Data.new(request)
          return if comment_data.invalid?

          generate_comment(comment_data)
        end

        private

        def generate_comment(data)
          comment = Comment.new(data)

          Lita::Github.add_comment(comment.repository,
                                   comment.number,
                                   comment.message)
        end
      end
    end
  end
end
