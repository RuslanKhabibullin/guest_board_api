require 'rspec_api_documentation/dsl'

resource 'Sessions' do
  header 'Accept', 'application/json'
  header 'Origin', 'localhost'

  subject(:response) { JSON.parse(response_body) }

  post 'api/v1/sign_in' do
    parameter :email, 'User email', required: true, scope: :user
    parameter :password, 'User password', scope: :user, required: true

    before { UserRepository.new.create(email: email, password: Password.encrypt(password)) }

    let(:email) { 'user@email.com' }
    let(:password) { '12345678' }

    example_request 'Sign in with empty password', user: { email: 'user@email.com', password: '' } do
      expect(response_status).to eq 422
      expect(response).to match(
        'error' => {
          'user' => {
            'password' => match_array(['must be filled', 'must contain at least 8 symbols'])
          }
        }
      )
      check_cors_response_headers
    end

    example_request 'Sign in with invalid password', user: { email: 'user@email.com', password: '12345670' } do
      expect(response_status).to eq 401
      expect(response).to eq('error' => { 'base' => ['unauthorized user'] })
      check_cors_response_headers
    end

    example_request 'Sing in with valid data' do
      expect(response_status).to eq 201
      expect(response).to match('token' => kind_of(String))
      check_cors_response_headers
    end
  end
end
