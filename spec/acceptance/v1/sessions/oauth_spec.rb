require 'rspec_api_documentation/dsl'

resource 'Sessions' do
  header 'Accept', 'application/json'
  header 'Origin', 'localhost'

  subject(:response) { JSON.parse(response_body) }

  post 'api/v1/sign_in/oauth' do
    parameter :provider, 'Oauth provider', required: true
    parameter :token, 'Oauth token', required: true

    example_request 'Sign in with invalid provider', provider: 'fb', token: 'token' do
      expect(response_status).to eq 400
      expect(response).to match(
        'error' => {
          'provider' => ['must be one of: google']
        }
      )
      check_cors_response_headers
    end

    context 'when user present on provider service' do
      before do
        stub_request(:get, 'https://www.googleapis.com/oauth2/v3/tokeninfo?id_token=token')
          .to_return(
            status: 200,
            body: oauth_response.to_json,
            headers: { 'Content-Type' => 'application/json' }
          )
      end

      let(:oauth_response) do
        {
          email: 'user@email.com',
          given_name: 'Test',
          family_name: 'User',
          picture: 'http://www.example.com/picture.jpeg'
        }
      end

      example_request 'Sign in with valid provider and user exists', provider: 'google', token: 'token' do
        expect(response_status).to eq 201
        expect(response).to match('token' => kind_of(String))
        check_cors_response_headers
      end

      context 'when user already exists' do
        before { create_user(email: 'user@email.com') }

        example_request 'Sign in with valid provider and user exists', provider: 'google', token: 'token' do
          expect(response_status).to eq 201
          expect(response).to match('token' => kind_of(String))
          check_cors_response_headers
        end
      end
    end
  end
end
