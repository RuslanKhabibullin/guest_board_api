describe UserRepository, type: :repository do
  describe '#by_email' do
    subject(:query) { described_class.new.by_email(email) }

    let(:email) { 'user@email.com' }

    it { is_expected.to be_falsey }

    context 'when user present but email not match' do
      before { create_user(email: 'another_user@email.com') }

      it { is_expected.to be_falsey }
    end

    context 'when user present and email match' do
      before { create_user(email: 'user@email.com') }

      it { is_expected.to be_kind_of(User) }
    end
  end
end
