module Api
  module Controllers
    module Sessions
      class Create
        include Api::Action

        def call(params)
          validation = Api::Validations::Signin.new(params[:user]).validate
          return status 422, JSON.generate(validation.messages) unless validation.success?

          session_creation_service = ::CreateSession.new(params[:user]).call
          if session_creation_service.successful?
            status 201, JSON.generate(token: session_creation_service.token)
          else
            status 401, 'Unauthorized user'
          end
        end
      end
    end
  end
end
