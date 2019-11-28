module Api
  module Presenters
    class ErrorPresenter
      def initialize(error)
        @error = error
      end

      def errors
        return { error: { base: @error } } if @error.is_a?(Array)

        if @error.respond_to?(:messages) || @error.respond_to?(:errors)
          errors = @error.respond_to?(:messages) ? @error.messages : @error.errors
          { error: errors }
        else
          { error: { base: [@error] } }
        end
      end

      def to_json(*_args)
        JSON.generate(errors)
      end
    end
  end
end
