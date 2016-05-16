require 'spec_helper'

describe Lita::Handlers::GithubReview, lita_handler: true do
  describe '#new_pull_request' do
    def mock_reviewers(reviewers)
      allow(Lita::Github).to receive(:add_comment)

      msg = 'config.handlers.github_review.reviewers'
      allow(Lita).to receive_message_chain(msg) { reviewers }

      allow(Lita::RandomReviewers).to receive(:get).and_return(reviewers)
    end

    context 'when action is not "opened"' do
      it 'does nothing' do
        mock_reviewers(%w(Mario Juan))
        payload = {
          action: 'edited',
          pull_request: { user: { login: 'Ramon' } }
        }.to_json

        http.post('/pull_requests/new', payload)

        expect(Lita::Github).not_to have_received(:add_comment)
      end
    end

    context 'when action is "opened"' do
      def github_payload(pr_number, repository)
        {
          action: 'opened',
          number: pr_number,
          pull_request: { user: { login: 'Ramon' } },
          repository: { full_name: repository }
        }.to_json
      end

      def expect_to_receive_comment(repository, pr_number, message)
        expect(Lita::Github)
          .to have_received(:add_comment).with(repository,
                                               pr_number,
                                               message)
      end

      context 'two reviewers' do
        it 'sends message to Github' do
          mock_reviewers(%w(Mario Juan))
          pr_number = 1
          repository = 'some/repo'
          payload = github_payload(pr_number, repository)
          expected_message = '+@Mario, +@Juan please review.'

          http.post('/pull_requests/new', payload)

          expect_to_receive_comment(repository, pr_number, expected_message)
        end
      end

      context 'one reviewer' do
        it 'sends message to Github' do
          mock_reviewers(%w(Mario))
          pr_number = 1
          repository = 'some/repo'
          payload = github_payload(pr_number, repository)
          expected_message = '+@Mario please review.'

          http.post('/pull_requests/new', payload)

          expect_to_receive_comment(repository, pr_number, expected_message)
        end
      end

      context 'no reviewers' do
        it 'does not send a message' do
          mock_reviewers([])
          pr_number = 1
          repository = 'some/repo'
          payload = github_payload(pr_number, repository)

          http.post('/pull_requests/new', payload)

          expect(Lita::Github).not_to have_received(:add_comment)
        end
      end
    end
  end
end
