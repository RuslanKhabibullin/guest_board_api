require 'hanami/interactor'

module Messages
  class BaseMessageService
    include Hanami::Interactor

    CHANNEL_NAME = 'presence-chat'.freeze

    attr_reader :message_repository, :pusher_client

    def initialize(message_repository: ::MessageRepository.new, pusher_client: PUSHER_CLIENT)
      @message_repository = message_repository
      @pusher_client = pusher_client
    end

    def call
      raise NotImplementedError
    end

    protected

    def push_to_channel(event_name, data)
      pusher_client.trigger(
        ENV.fetch('CHANNEL_NAME', CHANNEL_NAME),
        event_name,
        data
      )
    end
  end
end
