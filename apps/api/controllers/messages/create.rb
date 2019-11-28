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
            message = create_message(params[:message])
            status 201, Api::Presenters::Message::SinglePresenter.new(message).to_json
          else
            status 422, Api::Presenters::ErrorPresenter.new(params).to_json
          end
        end

        private

        def create_message(content:)
          base_message = repository.create(user_id: current_user.id, content: content)
          repository.load_user(base_message, user: current_user)
        end

        def repository
          @repository ||= MessageRepository.new
        end
      end
    end
  end
end
