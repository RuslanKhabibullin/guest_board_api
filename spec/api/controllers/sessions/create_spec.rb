describe Api::Controllers::Sessions::Create do
  subject(:action) { described_class.new }

  include_context 'action specs'

  context 'when params empty' do
    let(:params) { {} }
    let(:expected_body) do
      {
        'error' => {
          'user' => ['is missing']
        }
      }
    end

    it 'responds with 422 status and errors' do
      expect(response_status).to eq 422
      expect(json_response_body).to eq expected_body
    end
  end

  context 'when params invalid' do
    let(:params) { { user: {} } }
    let(:expected_body) do
      {
        'error' => {
          'user' => {
            'email' => [
              'is missing', 'must be an valid email'
            ],
            'password' => [
              'is missing', 'must contain at least 8 symbols'
            ]
          }
        }
      }
    end

    it 'responds with 422 status and errors' do
      expect(response_status).to eq 422
      expect(json_response_body).to eq expected_body
    end
  end

  context 'when params valid but user not exists' do
    let(:params) do
      {
        user: {
          email: 'user@email.com',
          password: '12345678'
        }
      }
    end
    let(:expected_response) do
      {
        'error' => {
          'base' => ['unauthorized user']
        }
      }
    end

    it 'responds with 401 status and error' do
      expect(response_status).to eq 401
      expect(json_response_body).to eq expected_response
    end
  end

  context 'when user already exists and params valid' do
    let(:user_attributes) do
      {
        email: 'user@email.com',
        password: '12345678'
      }
    end
    let(:params) { { user: user_attributes } }
    let(:expected_response) { { 'token' => kind_of(String) } }

    before do
      UserRepository.new.create(
        email: user_attributes[:email], password: Password.encrypt(user_attributes[:password])
      )
    end

    it 'responds with 201 status and token' do
      expect(response_status).to eq 201
      expect(json_response_body).to match expected_response
    end
  end
end
