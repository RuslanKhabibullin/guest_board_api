shared_context 'action specs' do
  let(:response) { action.call(params) }
  let(:response_status) { response[0] }
  let(:json_response_body) { JSON.parse(response_body) }
  let(:response_body) { response[2].first }
  let(:authenticator_mock) { double('Authenticator', 'authenticate!' => true) }
end
