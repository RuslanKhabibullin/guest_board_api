module Api
  module Controllers
    module Messages
      class Update
        include Api::Action

        params do
          required(:id).filled(:int?)
          required(:message).schema do
            required(:content).filled(:str?)
          end
        end
        def call(params)
          if params.valid?
            message = update_message(id: params[:id], message_attributes: params[:message])
            status 200, Api::Presenters::Message::SinglePresenter.new(message).to_json
          else
            status 422, Api::Presenters::ErrorPresenter.new(params).to_json
          end
        end

        private

        def update_message(id:, message_attributes:)
          old_message = MessageRepository.new.find_with_user(id)
          authorize(old_message, :manage?)

          ::Messages::UpdateMessage
            .new
            .call(old_message: old_message, update_message_attributes: message_attributes)
            .message
        end
      end
    end
  end
end
