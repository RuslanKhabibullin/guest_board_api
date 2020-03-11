module Api
  module Controllers
    module Authentication
      module Skip
        private

        def authenticate!
        end
      end

      module Soft
        private

        def authenticate!
          authenticate
        end
      end

      def self.included(action)
        action.class_eval do
          before :authenticate!
        end
      end

      def initialize(authenticator: nil)
        @authenticator = authenticator
      end

      private

      def current_user
        authenticator.user
      end

      def authenticate!
        authenticator.authenticate!
      end

      def authenticate
        authenticator.authenticate
      end

      def authenticator
        @authenticator || request.env['warden']
      end
    end
  end
end
