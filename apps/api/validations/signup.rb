require_relative 'custom_predicates'

module Api
  module Validations
    class Signup
      include Hanami::Validations::Form
      predicates CustomPredicates

      validations do
        required(:user).schema do
          required(:email).filled(:str?, :email?) { unique_email? }
          required(:password) { filled? & str? & long_password? }
          required(:first_name).filled(:str?)
          required(:last_name).filled(:str?)
        end
      end
    end
  end
end
