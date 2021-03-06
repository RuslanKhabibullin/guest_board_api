require 'rspec_api_documentation/dsl'

resource 'Messages' do
  header 'Accept', 'application/json'
  header 'Origin', 'localhost'

  subject(:response) { JSON.parse(response_body) }

  let(:message) { MessageRepository.new.create(user_id: current_user.id, content: 'Hi!') }

  patch 'api/v1/messages/:id' do
    parameter :id, 'Message id', required: true
    parameter :content, 'Message content', required: true, scope: :message

    it_behaves_like 'auth secured endpoint'

    context 'when user token provided' do
      let(:id) { message.id }

      include_context 'current user signed in'

      context 'when params invalid' do
        let(:content) { nil }
        let(:expected_response) do
          {
            'error' => {
              'message' => {
                'content' => ['must be filled']
              }
            }
          }
        end

        example_request 'Create with invalid params' do
          expect(response_status).to eq 422
          expect(response).to eq expected_response
          check_cors_response_headers
        end
      end

      context 'when params valid' do
        let(:content) { 'Bye!' }

        example_request 'Create with invalid params' do
          expect(response_status).to eq 200
          expect(response['entity']).to be_a_message_representation(Message.new(content: content))
          check_cors_response_headers
        end
      end

      context 'when message user doesnt equal to current_user' do
        let(:message_user) { create_user(email: 'another_user@email.com') }
        let!(:message) { MessageRepository.new.create(user_id: message_user.id, content: 'Hi!') }
        let(:id) { message.id }
        let(:content) { 'Bye!' }

        include_context 'current user signed in'
        it_behaves_like 'entity authorization secured'
      end
    end
  end
end
