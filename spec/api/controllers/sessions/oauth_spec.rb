describe Api::Controllers::Sessions::Oauth do
  subject(:action) { described_class.new }

  include_context 'action specs'

  context 'when params empty' do
    let(:params) { {} }
    let(:expected_body) do
      {
        'error' => {
          'provider' => ['is missing', 'must be one of: google'],
          'token' => ['is missing']
        }
      }
    end

    it 'responds with 400 status and errors' do
      expect(response_status).to eq 400
      expect(json_response_body).to eq expected_body
    end
  end

  context 'when params invalid' do
    let(:params) do
      {
        provider: 'fb',
        token: 'token'
      }
    end
    let(:expected_body) do
      {
        'error' => {
          'provider' => ['must be one of: google'],
        }
      }
    end

    it 'responds with 400 status and errors' do
      expect(response_status).to eq 400
      expect(json_response_body).to eq expected_body
    end
  end

  context 'when params valid' do
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
    let(:params) do
      {
        provider: 'google',
        token: 'token'
      }
    end

    it 'responds with 401 status and error' do
      expect(response_status).to eq 201
      expect(json_response_body).to match('token' => kind_of(String))
    end
  end
end
