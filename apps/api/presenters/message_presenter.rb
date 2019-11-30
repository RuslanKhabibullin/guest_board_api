module Api
  module Presenters
    module Message
      class SinglePresenter
        def initialize(message, with_header = true)
          @message = message
          @with_header = with_header
        end

        def as_json
          data = {
            id: @message.id,
            content: @message.content,
            created_at: @message.created_at,
            user: user_data
          }

          @with_header ? { entity: data } : data
        end

        def to_json(*_args)
          JSON.generate(as_json)
        end

        private

        def user_data
          return {} unless @message.user

          @message.user.to_h.slice(:id, :email)
        end
      end

      class CollectionPresenter
        def initialize(messages)
          @messages = messages
        end

        def to_json(*_args)
          data = {
            entities: @messages.map do |message|
              Api::Presenters::Message::SinglePresenter.new(message, false).as_json
            end
          }

          JSON.generate(data)
        end
      end
    end
  end
end
