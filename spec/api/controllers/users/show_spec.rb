describe Api::Controllers::Users::Show do
  subject(:action) { described_class.new(authenticator: authenticator_mock) }

  let!(:user) { UserRepository.new.create(email: 'user@email.com', password: '12345678') }
  let(:expected_response) do
    {
      'entity' => {
        'id' => user.id,
        'email' => 'user@email.com'
      }
    }
  end

  include_context 'action specs'

  it 'returns current_user response' do
    expect(response_status).to eq 200
    expect(json_response_body).to eq expected_response
  end
end
