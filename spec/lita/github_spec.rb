require 'spec_helper'

describe Lita::Github do
  describe '#add_comment' do
    it 'sends comment to GitHub' do
      instance = instance_double(Octokit::Client)
      allow(instance).to receive(:add_comment)
      allow(Octokit::Client).to receive(:new).and_return(instance)

      described_class.add_comment('ramon/repo', 1, 'Hola')

      expect(instance).to have_received(:add_comment)
    end
  end
end
