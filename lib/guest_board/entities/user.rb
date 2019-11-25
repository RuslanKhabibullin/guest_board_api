class User < Hanami::Entity
  def password
    Password.new(attributes[:password])
  end
end
