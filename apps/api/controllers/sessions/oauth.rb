module Api
  module Controllers
    module Sessions
      class Oauth
        include Api::Action
        include Api::Controllers::Authentication::Skip

        params do
          required(:token).filled
          required(:provider).filled(:str?, included_in?: ::Oauth::CreateUser.available_providers)
        end
        def call(params)
          return status 400, error_json(params) unless params.valid?

          service = ::Oauth::CreateUser.new(params).call
          if service.successful?
            status 201, { token: service.token }.to_json
          else
            status 401, error_json('unauthorized user')
          end
        end
      end
    end
  end
end
