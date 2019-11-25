require_relative 'custom_predicates'

module Api
  module Validations
    class Signin
      include Hanami::Validations::Form
      predicates CustomPredicates

      validations do
        required(:email) { filled? & str? & email? }
        required(:password) { filled? & str? & long_password? }
      end
    end
  end
end
