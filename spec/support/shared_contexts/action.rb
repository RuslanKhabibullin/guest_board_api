shared_context 'action specs' do
  let(:response) do
    action.call(respond_to?(:params) ? params : {})
  end
  let(:response_status) { response[0] }
  let(:json_response_body) { JSON.parse(response_body) }
  let(:response_body) { response[2].first }
  let(:authenticator_mock) do
    double('Authenticator',
      'authenticate!' => true,
      authenticate: true,
      user: respond_to?(:user) ? user : nil)
  end
end
