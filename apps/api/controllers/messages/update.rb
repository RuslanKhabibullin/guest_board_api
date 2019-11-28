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
          message = repository.update(id, message)
          repository.load_user(message, user: current_user)
        end

        def repository
          @repository ||= MessageRepository.new
        end
      end
    end
  end
end
