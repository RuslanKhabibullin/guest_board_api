describe Api::Validations::Signup do
  subject(:validator) { described_class.new(params).validate }

  it_behaves_like 'a user attributes validator'

  context 'when user with same email already exists' do
    let(:params) { { user: { email: 'user@email.com', password: '12345678' } } }

    before do
      UserRepository.new.create(
        email: params.dig(:user, :email),
        password: Password.encrypt(params.dig(:user, :password))
      )
    end

    it { is_expected.not_to be_success }
    it { expect(validator.messages.dig(:user, :email)).to eq ['must be an unique'] }
  end
end
