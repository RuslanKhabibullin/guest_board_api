describe MessageRepository, type: :repository do
  describe '#load_with_users' do
    subject(:query) { described_class.new.load_with_users(params) }

    let(:params) { {} }

    it { is_expected.to be_empty }

    context 'when messages present' do
      before do
        user = create_user
        described_class.new.create(user_id: user.id, content: 'Hello!')
      end

      let(:result) { query.first }

      it 'returns message with user' do
        expect(result.content).to eq 'Hello!'
        expect(result.user.email).to eq 'user@email.com'
      end
    end

    context 'when pagination params provided' do
      before do
        user = create_user
        described_class.new.create(user_id: user.id, content: 'Hello!')
      end

      let(:params) { { page: 2, limit: 1 } }

      it { is_expected.to be_empty }
    end
  end

  describe '#load_user' do
    subject(:query) { described_class.new.load_user(message, user_params) }

    let(:user) { create_user }
    let!(:message) { described_class.new.create(user_id: user.id, content: 'Hello') }

    context 'when user provided' do
      let(:user_params) { { user: user } }

      it { expect(query.user).to eq user }
    end

    context 'when user not provided' do
      let(:user_params) { {} }

      it { expect(query.user).to eq user }
    end
  end

  describe '#find_with_user' do
    subject(:query) { described_class.new.find_with_user(message.id) }

    let(:user) { create_user }
    let!(:message) { described_class.new.create(user_id: user.id, content: 'Hello') }

    it { expect(query.user).to eq user }
  end
end
