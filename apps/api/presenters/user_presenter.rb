module Api
  module Presenters
    class UserPresenter
      def initialize(user)
        @user = user
      end

      def to_json(*_args)
        JSON.generate(
          entity: {
            id: @user.id,
            email: @user.email
          }
        )
      end
    end
  end
end
