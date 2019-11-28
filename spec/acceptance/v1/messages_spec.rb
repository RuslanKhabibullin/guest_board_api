require 'rspec_api_documentation/dsl'

resource 'Messages' do
  header 'Accept', 'application/json'
  header 'Origin', 'localhost'

  subject(:response) { JSON.parse(response_body) }

  get 'api/v1/messages' do
    it_behaves_like 'auth secured endpoint'

    context 'when user token provided' do
      include_context 'current user signed in'

      let!(:message) { MessageRepository.new.create(content: 'Hello!', user_id: current_user.id) }

      let(:expected_response) do
        {
          'entities' => [
            {
              'id' => message.id,
              'content' => message.content,
              'user' => {
                'id' => current_user.id,
                'email' => current_user.email
              }
            }
          ]
        }
      end

      example_request 'Get user data with token' do
        expect(response_status).to eq 200
        expect(response).to eq expected_response
        check_cors_response_headers
      end
    end
  end
end
