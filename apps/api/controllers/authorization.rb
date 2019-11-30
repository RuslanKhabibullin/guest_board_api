module Api
  module Controllers
    module Authorization
      def self.included(action)
        action.class_eval do
          include Pundit
          handle_exception Pundit::NotAuthorizedError => :user_not_authorized
        end
      end

      private

      def user_not_authorized(_exception)
        status 403, error_json('forbidden')
      end
    end
  end
end
