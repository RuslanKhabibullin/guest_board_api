module Api
  module Controllers
    module Users
      class Create
        include Api::Action
        include Api::Controllers::Defaults

        def call(params)
          validation = Api::Validations::Signup.new(params[:user]).validate
          return status 422, error_json(validation) unless validation.success?

          user_creation_service = ::CreateUser.new(params[:user]).call
          if user_creation_service.successful?
            status 201, { token: user_creation_service.token }.to_json
          else
            status 422, error_json(user_creation_service)
          end
        end
      end
    end
  end
end
