describe Api::Controllers::Pusher::Authenticate do
  subject(:action) { described_class.new(authenticator: authenticator_mock) }

  include_context 'action specs'

  let(:params) do
    {
      channel_name: 'presence-chat',
      socket_id: 23
    }
  end

  context 'when current_user not present' do
    let(:authenticator_mock) do
      double('Authenticator', authenticate: false, user: nil)
    end

    it 'responds with 403 status' do
      expect(response_status).to eq 403
    end
  end

  context 'when current_user present' do
    let!(:user) { create_user(email: 'user@email.com', password: '1234567') }
    let(:authenticator_mock) do
      double('Authenticator', authenticate: true, user: user)
    end

    it 'responds with 200 status and user info' do
      expect(response_status).to eq 200
    end
  end
end
