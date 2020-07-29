module Messages
  class CreateMessage < BaseMessageService
    MESSAGE_CREATED_EVENT_NAME = 'message_created'.freeze

    expose :message

    def call(user:, message_attributes:)
      @message = message_repository.create(message_attributes.merge(user_id: user.id))
      @message = message_repository.load_user(@message, user: user)
      push_to_channel(
        message_created_event_name,
        @message
          .to_h
          .slice(:id, :content, :created_at)
          .merge(user: user.to_h.slice(:id, :email, :first_name, :last_name))
      )
    end

    private

    def message_created_event_name
      ENV.fetch('MESSAGE_CREATED_EVENT_NAME', MESSAGE_CREATED_EVENT_NAME)
    end
  end
end
