require 'hanami/validations'

module Api
  module Validations
    module CustomPredicates
      include Hanami::Validations::Predicates

      self.messages_path = 'config/messages.yml'

      predicate :unique_email? do |current|
        ::UserRepository.new.by_email(current).nil?
      end

      predicate :email? do |current|
        current.match?(::URI::MailTo::EMAIL_REGEXP)
      end

      predicate :long_password? do |current|
        current.length > 7
      end
    end
  end
end
