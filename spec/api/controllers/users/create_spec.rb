describe Api::Controllers::Users::Create do
  subject(:action) { described_class.new }

  include_context 'action specs'

  context 'when params empty' do
    let(:params) { {} }
    let(:expected_body) do
      {
        'error' => {
          'email' => [
            'is missing', 'must be an valid email', 'must be an unique'
          ],
          'password' => [
            'is missing', 'must contain at least 8 symbols'
          ]
        }
      }
    end

    it 'responds with 422 status and errors' do
      expect(response_status).to eq 422
      expect(json_response_body).to eq expected_body
    end
  end

  context 'when user already exists' do
    let(:user_attributes) do
      {
        email: 'user@email.com',
        password: '12345678'
      }
    end
    let(:params) { { user: user_attributes } }
    let(:expected_response) { { 'error' => { 'email' => ['must be an unique'] } } }

    before do
      UserRepository.new.create(
        email: user_attributes[:email], password: Password.encrypt(user_attributes[:password])
      )
    end

    it 'responds with 422 status and errors' do
      expect(response_status).to eq 422
      expect(json_response_body).to eq expected_response
    end
  end

  context 'when params valid' do
    let(:params) do
      {
        user: {
          email: 'user@email.com',
          password: '12345678'
        }
      }
    end
    let(:expected_response) { { 'token' => kind_of(String) } }

    it 'responds with 201 status and token' do
      expect(response_status).to eq 201
      expect(json_response_body).to match expected_response
    end
  end
end
