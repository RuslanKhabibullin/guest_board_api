require_relative 'custom_predicates'

module Api
  module Validations
    class Signup
      include Hanami::Validations::Form
      predicates CustomPredicates

      validations do
        required(:email).filled(:str?, :email?) { unique_email? }
        required(:password) { filled? & str? & long_password? }
      end
    end
  end
end
