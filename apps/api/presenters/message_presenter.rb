module Api
  module Presenter
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

          {
            id: @message.user.id,
            email: @message.user.email
          }
        end
      end

      class CollectionPresenter
        def initialize(messages)
          @messages = messages
        end

        def to_json(*_args)
          data = {
            entities: @messages.map do |message|
              Api::Presenter::Message::SinglePresenter.new(message, false).as_json
            end
          }

          JSON.generate(data)
        end
      end
    end
  end
end
