module Api
  module Presenters
    class UserPresenter
      def initialize(user)
        @user = user
      end

      def to_json(*_args)
        JSON.generate(entity: @user.to_h.slice(:id, :email, :first_name, :last_name))
      end
    end
  end
end
