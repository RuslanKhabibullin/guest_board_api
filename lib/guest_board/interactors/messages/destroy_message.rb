module Messages
  class DestroyMessage < BaseMessageService
    MESSAGE_DELETED_EVENT_NAME = 'message_deleted'.freeze

    def call(message)
      message_repository.delete(message.id)
      push_to_channel(message_deleted_event_name, message_id: message.id)
    end

    private

    def message_deleted_event_name
      ENV.fetch('MESSAGE_DELETED_EVENT_NAME', MESSAGE_DELETED_EVENT_NAME)
    end
  end
end
