describe Api::Controllers::Messages::Create do
  subject(:action) { described_class.new(authenticator: authenticator_mock) }

  let!(:user) { create_user(email: 'user@email.com', password: '12345678') }

  include_context 'action specs'

  context 'when params empty' do
    let(:params) { {} }
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
    let(:params) { { message: {} } }
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
    let(:params) { { message: { content: 'Hello!' } } }

    it { expect(response_status).to eq 201 }

    it 'returns message' do
      expect(json_response_body['entity'])
        .to be_a_message_representation(Message.new(content: 'Hello!'))
    end
  end
end
