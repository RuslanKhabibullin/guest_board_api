describe Api::Controllers::Users::Create do
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
              'is missing', 'must be an valid email', 'must be an unique'
            ],
            'password' => [
              'is missing', 'must contain at least 8 symbols'
            ],
            'first_name' => ['is missing'],
            'last_name' => ['is missing']
          }
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
        password: '12345678',
        first_name: 'User',
        last_name: 'Test'
      }
    end
    let(:params) { { user: user_attributes } }
    let(:expected_response) { { 'error' => { 'user' => { 'email' => ['must be an unique'] } } } }

    before { create_user(user_attributes) }

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
          password: '12345678',
          first_name: 'User',
          last_name: 'Test'
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
