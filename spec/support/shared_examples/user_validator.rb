shared_examples 'a user attributes validator' do
  context 'when params empty' do
    let(:params) { {} }

    it { is_expected.not_to be_success }
    it { expect(validator.messages[:email]).to include('is missing') }
    it { expect(validator.messages[:password]).to match_array(['is missing', 'must contain at least 8 symbols']) }
  end

  context 'when when params invalid' do
    let(:params) do
      {
        email: 'john.constantine.com',
        password: '42'
      }
    end

    it { is_expected.not_to be_success }
    it { expect(validator.messages[:email]).to include('must be an valid email') }
    it { expect(validator.messages[:password]).to eq ['must contain at least 8 symbols'] }
  end

  context 'when params valid' do
    let(:params) do
      {
        email: 'valid@email.com',
        password: '12345678'
      }
    end

    it { is_expected.to be_success }
  end
end
 
