describe Api::Controllers::Messages::Update do
  subject(:action) { described_class.new(authenticator: authenticator_mock) }

  let(:user) { create_user(email: 'user@email.com', password: '12345678') }
  let!(:message) { MessageRepository.new.create(user_id: user.id, content: 'Hello') }

  include_context 'action specs'

  context 'when params empty' do
    let(:params) { { id: message.id } }
    let(:expected_response) do
      {
        'error' => {
          'message' => ['is missing']
        }
      }
    end

    it { expect(response_status).to eq 422 }
    it { expect(json_response_body).to eq expected_response }
  end

  context 'when params invalid' do
    let(:params) { { id: message.id, message: {} } }
    let(:expected_response) do
      {
        'error' => {
          'message' => {
            'content' => ['is missing']
          }
        }
      }
    end

    it { expect(response_status).to eq 422 }
    it { expect(json_response_body).to eq expected_response }
  end

  context 'when params valid' do
    let(:params) { { id: message.id, message: { content: 'Bye!' } } }

    it { expect(response_status).to eq 200 }

    it 'returns message representation' do
      expect(json_response_body['entity'])
        .to be_a_message_representation(Message.new(content: 'Bye!'))
    end
  end
end
