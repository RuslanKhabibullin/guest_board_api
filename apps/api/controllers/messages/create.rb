module Api
  module Controllers
    module Messages
      class Create
        include Api::Action

        params do
          required(:message).schema do
            required(:content).filled(:str?)
          end
        end
        def call(params)
          if params.valid?
            message = create_message(params)
            status 201, Api::Presenters::Message::SinglePresenter.new(message).to_json
          else
            status 422, Api::Presenters::ErrorPresenter.new(params).to_json
          end
        end

        private

        def create_message(message:)
          ::Messages::CreateMessage
            .new
            .call(message_attributes: message, user: current_user)
            .message
        end
      end
    end
  end
end
