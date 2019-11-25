module JWT
  class Wrapper
    def self.encode(payload)
      JWT.encode(payload, ENV['JWT_SECRET_KEY'])
    end

    def self.decode(token)
      decoded_token = JWT.decode(token, ENV['JWT_SECRET_KEY'])
      decoded_token.first
    end
  end
end
