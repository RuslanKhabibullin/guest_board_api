module Api
  module Controllers
    class Unauthorized
      include Api::Action
      include Api::Controllers::Authentication::Skip

      def self.call(env)
        new.call(env)
      end

      def call(_params)
        status 401, error_json('unauthorized user')
      end
    end
  end
end
