require 'hanami/interactor'

class CreateUser
  include Hanami::Interactor

  expose :user
  expose :token

  attr_reader :user_attributes, :password_service, :user_repository
  private :user_attributes, :password_service, :user_repository

  def initialize(user_attributes, password_service: ::Password, user_repository: ::UserRepository.new)
    @user_attributes = user_attributes
    @password_service = password_service
    @user_repository = user_repository
  end

  def call
    @user = user_repository.create(user_creation_attributes)
    @token = JWT::Wrapper.encode(token_payload)
  end

  def valid?
    user_repository.by_email(user_attributes[:email]).nil?
  end

  private

  def user_creation_attributes
    {
      email: user_attributes[:email],
      password: password_service.encrypt(user_attributes[:password])
    }
  end

  def token_payload
    JWT::Payload.payload_for(@user)
  end
end
