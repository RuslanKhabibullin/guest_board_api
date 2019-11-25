module JWT
  class Payload
    def self.payload_for(user)
      {
        sub: user.id,
        iat: Time.now.utc.to_i,
        iss: ENV.fetch('HOST', 'http://www.example.com')
      }
    end
  end
end
