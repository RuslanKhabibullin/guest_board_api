module Clients
  class Google
    include HTTParty
    base_uri 'https://www.googleapis.com/oauth2/v3'

    attr_reader :token
    private :token

    def initialize(token)
      @token = token
    end

    def user_info
      info = self.class.get('/tokeninfo', id_token: token).parsed_response

      [
        {
          email: info['email'],
          first_name: info['given_name'],
          last_name: info['family_name'],
          avatar_url: info['picture']
        },
        info
      ]
    end
  end
end
