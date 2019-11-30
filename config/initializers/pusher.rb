if Hanami.env == 'test'
  PusherClient = Struct.new('PusherClient') do
    def trigger(*_args)
      true
    end
  end
  PUSHER_CLIENT = PusherClient.new
else
  PUSHER_CLIENT = Pusher::Client.new(
    app_id: ENV['PUSHER_APP_ID'],
    key: ENV['PUSHER_APP_KEY'],
    secret: ENV['PUSHER_APP_SECRET'],
    cluster: 'ap2',
    encrypted: true
  )
end
