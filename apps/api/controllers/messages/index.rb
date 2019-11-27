module Api
  module Controllers
    module Messages
      class Index
        include Api::Action

        def call(_params)
          status 200, JSON.generate(MessageRepository.new.all.map do |message|
              {
                id: message.id,
                user_id: message.user_id,
                content: message.content
              }
            end
          )
        end
      end
    end
  end
end
