module Api
  module Controllers
    module Pusher
      class Authenticate
        include Api::Action
        include Api::Controllers::Authentication::Soft

        params do
          required(:channel_name).filled(:str?)
          required(:socket_id).filled(:str?)
        end
        def call(params)
          if current_user
            response = ::PUSHER_CLIENT.authenticate(params[:channel_name], params[:socket_id], user_data)
            status 200, JSON.generate(response)
          else
            # According to Pusher documentation https://pusher.com/docs/channels/server_api/authenticating-users
            status 403, error_json('Forbidden')
          end
        end

        private

        def user_data
          {
            user_id: current_user.id,
            user_info: {
              email: current_user.email,
              first_name: current_user.first_name,
              last_name: current_user.last_name
            }
          }
        end
      end
    end
  end
end
