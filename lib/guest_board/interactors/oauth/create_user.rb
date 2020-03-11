module Oauth
  class CreateUser
    include Hanami::Interactor

    # Weird problem with constant loading.
    PROVIDER_MAP = {
      google: '::Clients::Google'
    }.freeze

    expose :user
    expose :token

    delegate :user_info, to: :client

    attr_reader :oauth_token, :provider, :user_repository, :password_service
    private :oauth_token, :provider, :user_repository, :password_service

    def self.available_providers
      PROVIDER_MAP.keys.map(&:to_s)
    end

    def initialize(oauth_params, password_service: ::Password, user_repository: ::UserRepository.new)
      @oauth_token = oauth_params[:token]
      @provider = oauth_params[:provider]
      @user_repository = user_repository
      @password_service = password_service
    end

    def call
      @user = user_repository.by_email(user_attributes[:email]) || user_repository.create(user_attributes)
      @token = ::JWT::Wrapper.encode(token_payload)
    end

    def valid?
      oauth_token.present? && provider.present? && provider_client_service.present?
    end

    private

    def provider_client_service
      PROVIDER_MAP[provider.to_sym]&.constantize
    end

    def client
      @client ||= provider_client_service.new(oauth_token)
    end

    def user_attributes
      @user_attributes ||= begin
        info, _actual_response = client.user_info
        info.merge(password: password_service.generate_and_encrypt)
      end
    end

    def token_payload
      ::JWT::Payload.payload_for(@user)
    end
  end
end
