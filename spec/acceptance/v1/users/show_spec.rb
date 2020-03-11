require 'rspec_api_documentation/dsl'

resource 'Users' do
  header 'Accept', 'application/json'
  header 'Origin', 'localhost'

  subject(:response) { JSON.parse(response_body) }

  get 'api/v1/users/me' do
    it_behaves_like 'auth secured endpoint'

    context 'when user token provided' do
      include_context 'current user signed in'

      let(:expected_response) do
        {
          'entity' => {
            'id' => current_user.id,
            'email' => current_user.email,
            'first_name' => current_user.first_name,
            'last_name' => current_user.last_name
          }
        }
      end

      example_request 'Get user data with token' do
        expect(response_status).to eq 200
        expect(response).to eq expected_response
        check_cors_response_headers
      end
    end
  end
end
