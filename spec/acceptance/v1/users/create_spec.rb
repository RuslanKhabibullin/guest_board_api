require 'rspec_api_documentation/dsl'

resource 'Users' do
  header 'Accept', 'application/json'
  header 'Origin', 'localhost'

  subject(:response) { JSON.parse(response_body) }

  post 'api/v1/sign_up' do
    parameter :email, 'User email', required: true, scope: :user
    parameter :password, 'User password', scope: :user, required: true

    let(:email) { 'user@email.com' }
    let(:password) { '12345678' }

    example_request 'Sign up with empty password', user: { email: 'user@email.com', password: '' } do
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

    example_request 'Sign up with valid data' do
      expect(response_status).to eq 201
      expect(response).to match('token' => kind_of(String))
      check_cors_response_headers
    end

    context 'when user already exists' do
      before { UserRepository.new.create(email: email, password: Password.encrypt(password)) }

      example_request 'Sign up with already existed email' do
        expect(response_status).to eq 422
        expect(response).to eq(
          'error' => {
            'user' => {
              'email' => ['must be an unique']
            }
          }
        )
        check_cors_response_headers
      end
    end
  end
end
