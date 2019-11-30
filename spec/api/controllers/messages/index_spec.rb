describe Api::Controllers::Messages::Index, type: :action do
  let(:action) { described_class.new(authenticator: authenticator_mock) }
  let(:params) { {} }

  include_context 'action specs'

  context 'when messages not present' do
    let(:expected_response) { { 'entities' => [] } }

    it 'returns success response without data' do
      expect(response_status).to eq 200
      expect(json_response_body).to eq expected_response
    end
  end

  context 'when messages present' do
    let(:user) { UserRepository.new.create(email: 'user@email.com', password: '12345678') }
    let!(:message) { MessageRepository.new.create(user_id: user.id, content: 'Hello!') }

    it 'returns success response with message and nested user' do
      expect(response_status).to eq 200
      expect(json_response_body['entities'].first).to be_a_message_representation(message)
    end

    context 'when pagination params present' do
      let(:params) { { limit: 1, page: 2 } }

      it 'returns empty response' do
        expect(response_status).to eq 200
        expect(json_response_body['entities']).to be_empty
      end
    end
  end
end
