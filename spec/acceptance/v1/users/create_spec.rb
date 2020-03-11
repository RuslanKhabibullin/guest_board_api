require 'rspec_api_documentation/dsl'

resource 'Users' do
  header 'Accept', 'application/json'
  header 'Origin', 'localhost'

  subject(:response) { JSON.parse(response_body) }

  post 'api/v1/sign_up' do
    parameter :email, 'User email', required: true, scope: :user
    parameter :password, 'User password', scope: :user, required: true
    parameter :first_name, 'User first name', scope: :user, required: true
    parameter :last_name, 'User last name', scope: :user, required: true

    let(:email) { 'user@email.com' }
    let(:first_name) { 'User' }
    let(:last_name) { 'Test' }
    let(:password) { '12345678' }

    example_request 'Sign up with empty password', user: { password: '' } do
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
      before { create_user(email: email, password: password) }

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
