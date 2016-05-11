require 'spec_helper'

describe Lita::Handlers::ReviewerLotto, lita_handler: true do
  describe 'New Pull Request' do
    context 'when action is not "opened"' do
      it 'does nothing' do
        data = { action: 'edited' }.to_json
        allow(Lita::Github).to receive(:add_comment)

        http.post('/pull_requests/new', data)

        expect(Lita::Github).not_to have_received(:add_comment)
      end
    end

    context 'when action is "opened"' do
      it 'sends message to Github' do
        allow(Lita::Github).to receive(:add_comment)
        action = 'opened'
        pr_number = 1
        repository = 'some/repo'
        payload = {
          action: action,
          number: pr_number,
          repository: {
            full_name: repository
          }
        }.to_json

        http.post('/pull_requests/new', payload)

        expect(Lita::Github).to have_received(:add_comment).with(repository,
                                                                 pr_number,
                                                                 'Hola Ramon')
      end
    end
  end
end
