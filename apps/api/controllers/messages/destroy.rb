module Api
  module Controllers
    module Messages
      class Destroy
        include Api::Action

        params do
          required(:id).filled(:int?)
        end
        def call(params)
          message = MessageRepository.new.find_with_user(params[:id])
          authorize(message, :manage?) && ::Messages::DestroyMessage.new.call(message)

          status 204, {}
        end
      end
    end
  end
end
