shared_examples 'a user attributes validator' do
  context 'when params empty' do
    let(:params) { {} }

    it { is_expected.not_to be_success }
    it { expect(validator.messages[:user]).to eq ['is missing'] }
  end

  context 'when params invalid' do
    let(:params) do
      {
        user: {
          email: 'john.constantine.com',
          password: '42'
        }
      }
    end

    it { is_expected.not_to be_success }
    it { expect(validator.messages.dig(:user, :email)).to include('must be an valid email') }
    it { expect(validator.messages.dig(:user, :password)).to eq ['must contain at least 8 symbols'] }
  end

  context 'when params valid' do
    let(:params) do
      {
        user: {
          email: 'valid@email.com',
          password: '12345678'
        }
      }
    end

    it { is_expected.to be_success }
  end
end
