module Messages
  class UpdateMessage < BaseMessageService
    MESSAGE_UPDATED_EVENT_NAME = 'message_updated'.freeze

    expose :message

    def call(old_message:, update_message_attributes:)
      message_repository.update(old_message.id, update_message_attributes)
      @message = message_repository.find_with_user(old_message.id)

      push_to_channel(
        message_updated_event_name,
        @message.to_h.slice(:id, :content, :created_at).merge(
          user: { id: @message.user.id, email: @message.user.email }
        )
      )
    end

    private

    def message_updated_event_name
      ENV.fetch('MESSAGE_UPDATED_EVENT_NAME', MESSAGE_UPDATED_EVENT_NAME)
    end
  end
end
