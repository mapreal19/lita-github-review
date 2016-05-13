require 'octokit'

module Lita
  module Github
    class << self
      def add_comment(repository, number, message)
        client.add_comment(repository, number, message)
      end

      private

      def client
        @client ||= Octokit::Client.new(access_token: token)
      end

      def token
        Lita.config.handlers.reviewer_lotto.github_token
      end
    end
  end
end
