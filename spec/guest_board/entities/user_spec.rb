describe User, type: :entity do
  let(:user_attributes) do
    {
      email: 'test@user.com',
      password: Password.encrypt('1234567'),
      first_name: 'Test',
      last_name: 'User'
    }
  end

  it 'can be initialized with email, password, first_name and last_name' do
    user = described_class.new(user_attributes)
    expect(user.email).to eq 'test@user.com'
    expect(user.password).to eq '1234567'
    expect(user.first_name).to eq 'Test'
    expect(user.last_name).to eq 'User'
  end
end
