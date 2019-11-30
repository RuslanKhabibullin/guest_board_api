require 'rspec_api_documentation/dsl'

resource 'Messages' do
  header 'Accept', 'application/json'
  header 'Origin', 'localhost'

  subject(:response) { JSON.parse(response_body) }

  post 'api/v1/messages' do
    parameter :content, 'Message content', required: true, scope: :message

    it_behaves_like 'auth secured endpoint'

    context 'when user token provided' do
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
        let(:content) { 'Say hello to my little friend!' }

        example_request 'Create with invalid params' do
          expect(response_status).to eq 201
          expect(response['entity'])
            .to be_a_message_representation(Message.new(content: content))
          check_cors_response_headers
        end
      end
    end
  end
end
