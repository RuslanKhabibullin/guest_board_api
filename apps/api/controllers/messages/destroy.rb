module Api
  module Controllers
    module Messages
      class Destroy
        include Api::Action

        params do
          required(:id).filled(:int?)
        end
        def call(params)
          message = repository.find_with_user(params[:id])
          authorize(message, :manage?) && repository.delete(message.id)

          status 204, {}
        end

        private

        def repository
          @repository ||= MessageRepository.new
        end
      end
    end
  end
end
