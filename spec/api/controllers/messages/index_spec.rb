describe Api::Controllers::Messages::Index, type: :action do
  let(:action) { described_class.new(authenticator: authenticator_mock) }
  let(:params) { Hash[] }

  include_context 'action specs'

  it 'is successful' do
    response = action.call(params)
    expect(response[0]).to eq 200
  end
end
