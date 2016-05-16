require 'spec_helper'

describe Lita::Github::Reviewers do
  def mock_config_reviewers(reviewers)
    msg = 'config.handlers.github_review.reviewers'
    allow(Lita).to receive_message_chain(msg) { reviewers }
  end

  describe '#to_s' do
    it 'does not return author as a reviewer' do
      author = 'Mario'
      mock_config_reviewers(%w(Mario Pepe))
      reviewers = described_class.new(author)

      result = reviewers.to_s

      expect(result).not_to include(author)
    end
  end

  describe '#present?' do
    context 'with reviewers' do
      it 'returns true' do
        mock_config_reviewers(%w(Mario Pepe))
        reviewers = described_class.new('Ramon')

        result = reviewers.present?

        expect(result).to be true
      end
    end

    context 'without reviewers' do
      it 'returns false' do
        mock_config_reviewers([])
        reviewers = described_class.new('Ramon')

        result = reviewers.present?

        expect(result).to be false
      end
    end
  end
end
