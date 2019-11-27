class UserRepository < Hanami::Repository
  associations do
    has_many :messages
  end

  def by_email(email)
    users.where(email: email).first
  end
end
