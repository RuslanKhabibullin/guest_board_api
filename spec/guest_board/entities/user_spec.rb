describe User, type: :entity do
  let(:user_attributes) do
    {
      email: 'test@user.com',
      password: Password.encrypt('1234567')
    }
  end

  it 'can be initialized with email and password' do
    user = described_class.new(user_attributes)
    expect(user.email).to eq 'test@user.com'
    expect(user.password).to eq '1234567'
  end
end
