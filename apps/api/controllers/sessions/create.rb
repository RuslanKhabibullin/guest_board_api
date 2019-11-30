module Api
  module Controllers
    module Sessions
      class Create
        include Api::Action
        include Api::Controllers::Authentication::Skip

        def call(params)
          validation = Api::Validations::Signin.new(params).validate
          return status 422, error_json(validation) unless validation.success?

          session_creation_service = ::CreateSession.new(params[:user]).call
          if session_creation_service.successful?
            status 201, { token: session_creation_service.token }.to_json
          else
            status 401, error_json('unauthorized user')
          end
        end
      end
    end
  end
end
