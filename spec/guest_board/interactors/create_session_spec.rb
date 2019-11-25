describe CreateSession do
  subject(:interactor) { described_class.new(user_attributes).call }

  let(:user_attributes) do
    { email: 'user@email.com', password: '1234567' }
  end

  context 'when user not exists' do
    it { is_expected.not_to be_successful }
    it { expect(interactor.errors).to eq ['User not found'] }
    it { expect(interactor.token).to be_falsey }
    it { expect(interactor.user).to be_falsey }
  end

  context 'when user exists' do
    before do
      UserRepository.new.create(
        email: user_attributes[:email],
        password: Password.encrypt(user_attributes[:password])
      )
    end

    it { is_expected.to be_successful }
    it { expect(interactor.user).to be_kind_of(User) }
    it { expect(interactor.token).to be_truthy }
  end
end
