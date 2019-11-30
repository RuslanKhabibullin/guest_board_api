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
            message = update_message(params)
            status 200, Api::Presenters::Message::SinglePresenter.new(message).to_json
          else
            status 422, Api::Presenters::ErrorPresenter.new(params).to_json
          end
        end

        private

        def update_message(id:, message:)
          message_entity = repository.find_with_user(id)
          updated_message_entity = authorize(message_entity, :manage?) && repository.update(id, message)
          repository.load_user(updated_message_entity, user: current_user)
        end

        def repository
          @repository ||= MessageRepository.new
        end
      end
    end
  end
end
