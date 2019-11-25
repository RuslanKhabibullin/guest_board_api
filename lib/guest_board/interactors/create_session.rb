require 'hanami/interactor'

class CreateSession
  include Hanami::Interactor

  expose :user
  expose :token

  attr_reader :user_attributes, :user_repository
  private :user_attributes, :user_repository

  def initialize(user_attributes, user_repository: ::UserRepository.new)
    @user_attributes = user_attributes
    @user_repository = user_repository
  end

  def call
    @user = user_repository.by_email(user_attributes[:email])
    if @user && @user.password == user_attributes[:password]
      @token = JWT::Wrapper.encode(token_payload)
    else
      error!('User not found')
    end
  end

  private

  def token_payload
    JWT::Payload.payload_for(@user)
  end
end
