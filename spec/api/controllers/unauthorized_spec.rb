describe Api::Controllers::Unauthorized do
  subject(:action) { described_class.new }

  let(:params) { {} }
  let(:expected_response) do
    {
      'error' => {
        'base' => ['unauthorized user']
      }
    }
  end

  include_context 'action specs'

  it 'responds with 401 status and error' do
    expect(response_status).to eq 401
    expect(json_response_body).to eq expected_response
  end

  context 'when action called from #call method (as a devise failure app for example)' do
    subject(:action) { described_class.call({}) }

    it { expect(action[0]).to eq 401 }
    it { expect(JSON.parse(action[2].first)).to eq expected_response }
  end
end
