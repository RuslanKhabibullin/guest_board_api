module Api
  module Controllers
    module Messages
      class Destroy
        include Api::Action

        params do
          required(:id).filled(:int?)
        end
        def call(params)
          MessageRepository.new.delete(params[:id])
          status 204, {}
        end
      end
    end
  end
end
