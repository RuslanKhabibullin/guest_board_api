describe MessageRepository, type: :repository do
  describe '#load_with_users' do
    subject(:query) { described_class.new.load_with_users(params) }

    let(:params) { {} }

    it { is_expected.to be_empty }

    context 'when messages present' do
      before do
        user = UserRepository.new.create(email: 'user@email.com', password: '12345678')
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
        user = UserRepository.new.create(email: 'user@email.com', password: '12345678')
        described_class.new.create(user_id: user.id, content: 'Hello!')
      end

      let(:params) { { page: 2, limit: 1 } }

      it { is_expected.to be_empty }
    end
  end
end
