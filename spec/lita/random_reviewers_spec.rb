require 'spec_helper'

describe Lita::RandomReviewers do
  describe '#get' do
    context 'with more than 2 reviewers' do
      it 'returns 2 random reviewers' do
        reviewers_pool = %w(Ramon Mario Pepe)
        random_reviewers = %w(Ramon Pepe)
        allow(reviewers_pool).to receive(:sample) { random_reviewers }

        reviewers = described_class.get(reviewers_pool)

        expect(reviewers).to eq random_reviewers
      end
    end

    context 'with one reviewer' do
      it 'returns that reviewer' do
        reviewers_pool = ['Ramon']

        reviewers = described_class.get(reviewers_pool)

        expect(reviewers).to eq ['Ramon']
      end
    end

    context 'with no reviewers' do
      it 'returns empty array' do
        reviewers_pool = nil

        reviewers = described_class.get(reviewers_pool)

        expect(reviewers).to eq []
      end
    end
  end
end
