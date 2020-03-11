require 'rspec_api_documentation/dsl'

resource 'Pusher' do
  header 'Accept', 'application/json'
  header 'Origin', 'localhost'

  subject(:response) { JSON.parse(response_body) }

  post 'api/v1/pusher/authenticate' do
    parameter :channel_name, 'Pusher channel name', required: true
    parameter :socket_id, 'Pusher socket id', required: true

    example_request 'auth without token', channel_name: 'test', socket_id: 23 do
      expect(response_status).to eq 403
      check_cors_response_headers
    end

    context 'when token provided' do
      include_context 'current user signed in'

      example_request 'auth token provided', channel_name: 'test', socket_id: 23 do
        expect(response_status).to eq 200
        check_cors_response_headers
      end
    end
  end
end
