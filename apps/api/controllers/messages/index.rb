module Api
  module Controllers
    module Messages
      class Index
        include Api::Action

        def call(params)
          messages = MessageRepository.new.load_with_users(
            limit: (params[:limit] || 20).to_i,
            page: (params[:page] || 1).to_i
          )

          status 200, Api::Presenters::Message::CollectionPresenter.new(messages).to_json
        end
      end
    end
  end
end
