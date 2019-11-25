module Api
  module Controllers
    module Users
      class Create
        include Api::Action

        def call(params)
          validation = Api::Validations::Signup.new(params[:user]).validate
          return status 422, JSON.generate(validation.messages) unless validation.success?

          user_creation_service = ::CreateUser.new(params[:user]).call
          if user_creation_service.successful?
            status 201, JSON.generate(token: user_creation_service.token)
          else
            status 422, JSON.generate(user_creation_service.errors)
          end
        end
      end
    end
  end
end
