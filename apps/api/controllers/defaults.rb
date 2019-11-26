module Api
  module Controllers
    module Defaults
      def error_json(error)
        Api::Presenters::ErrorPresenter.new(error).to_json
      end
    end
  end
end
