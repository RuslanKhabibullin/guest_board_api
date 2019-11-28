describe Api::Controllers::Messages::Destroy do
  subject(:action) { described_class.new(authenticator: authenticator_mock) }

  let(:user) { UserRepository.new.create(email: 'user@email.com', password: '12345678') }
  let!(:message) { MessageRepository.new.create(user_id: user.id, content: 'Hello') }
  let(:params) { { id: message.id } }

  include_context 'action specs'

  it 'deletes message' do
    expect(response_status).to eq 204
    expect(MessageRepository.new.find(message.id)).to be_falsey
  end
end
