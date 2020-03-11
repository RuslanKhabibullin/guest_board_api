describe CreateUser do
  subject(:interactor) { described_class.new(user_attributes).call }

  let(:user_attributes) do
    {
      email: 'user@email.com',
      password: '1234567',
      first_name: 'Test',
      last_name: 'User'
    }
  end

  context 'when user not exists' do
    it { is_expected.to be_successful }
    it { expect(interactor.token).to be_truthy }
    it { expect(interactor.user).to be_kind_of(User) }
  end

  context 'when user already exists' do
    before { create_user(user_attributes) }

    it { is_expected.not_to be_successful }
  end
end
