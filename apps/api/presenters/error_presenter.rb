module Api
  module Presenters
    class ErrorPresenter
      def initialize(error)
        @error = error
      end

      def errors
        return { error: @error.messages } if @error.respond_to?(:messages)
        return { error: { base: @error.errors } } if @error.respond_to?(:errors)
        return { error: { base: @error } } if @error.is_a?(Array)

        { error: { base: [@error] } }
      end

      def to_json(*_args)
        JSON.generate(errors)
      end
    end
  end
end
