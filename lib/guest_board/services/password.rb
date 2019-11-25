class Password
  class << self
    def encrypt(data, cost: cost_factor)
      BCrypt::Password.create(data, cost: cost)
    end

    def cost_factor
      Hanami.env == 'test' ? 1 : 12
    end
  end

  attr_reader :password_digest
  private :password_digest

  def initialize(password_digest)
    @password_digest = BCrypt::Password.new(password_digest)
  end

  def ==(other)
    password_digest == other
  end
end
