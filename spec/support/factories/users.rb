def create_user(attributes = {}, user_repository = ::UserRepository.new)
  user_attributes = {
    email: attributes.fetch(:email, 'user@email.com'),
    password: Password.encrypt(attributes.fetch(:password, '12345678')),
    first_name: attributes.fetch(:first_name, 'Test'),
    last_name: attributes.fetch(:last_name, 'User')
  }

  user_repository.create(user_attributes)
end
