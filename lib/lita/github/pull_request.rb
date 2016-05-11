require_relative '../json_helper'

module Lita
  module Github
    class PullRequest
      VALID_ACTION = 'opened'.freeze

      def initialize(request)
        @body = Lita::JsonHelper.load(request.body)
      end

      def open?
        action != VALID_ACTION
      end

      def number
        body[:number]
      end

      def repository
        body[:repository][:full_name]
      end

      private

      attr_reader :body

      def action
        body[:action]
      end
    end
  end
end
