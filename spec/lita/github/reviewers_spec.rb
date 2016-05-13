require 'spec_helper'

describe Lita::Github::Reviewers do
  describe '#present?' do
    def mock_config_reviewers(reviewers)
      msg = 'config.handlers.reviewer_lotto.reviewers'
      allow(Lita).to receive_message_chain(msg) { reviewers }
    end

    context 'with reviewers' do
      it 'returns true' do
        mock_config_reviewers(%w(Mario Pepe))
        reviewers = described_class.new

        result = reviewers.present?

        expect(result).to be true
      end
    end

    context 'without reviewers' do
      it 'returns false' do
        mock_config_reviewers(nil)
        reviewers = described_class.new

        result = reviewers.present?

        expect(result).to be false
      end
    end
  end
end
