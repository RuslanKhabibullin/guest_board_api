require 'rspec_api_documentation/dsl'

resource 'Messages' do
  header 'Accept', 'application/json'
  header 'Origin', 'localhost'

  let(:message) { MessageRepository.new.create(user_id: current_user.id, content: 'Hi!') }

  delete 'api/v1/messages/:id' do
    parameter :id, 'Message id', required: true

    it_behaves_like 'auth secured endpoint'

    context 'when user token provided' do
      let(:id) { message.id }

      include_context 'current user signed in'

      example_request 'Create with invalid params' do
        expect(response_status).to eq 204
        expect(MessageRepository.new.find(message.id)).to be_falsey
        check_cors_response_headers
      end
    end
  end
end