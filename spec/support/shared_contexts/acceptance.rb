shared_context 'current user signed in' do
  let(:current_user) do
    UserRepository.new.create(email: 'current_user@email.com', password: Password.encrypt('12345678'))
  end
  let(:token) { JWT::Wrapper.encode(JWT::Payload.payload_for(current_user)) }

  before { header 'Authorization', "Bearer #{token}" }
end
