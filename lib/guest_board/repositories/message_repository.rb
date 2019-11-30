class MessageRepository < Hanami::Repository
  associations do
    belongs_to :user
  end

  def load_with_users(limit: 20, page: 1)
    offset = page > 1 ? limit * (page - 1) : 0

    aggregate(:user)
      .order { created_at.desc }
      .offset(offset)
      .limit(limit)
      .map_to(Message)
      .to_a
  end

  def find_with_user(id)
    aggregate(:user).where(id: id).map_to(Message).one
  end

  def load_user(message, user: nil)
    user ||= UserRepository.new.find(message.user_id)

    Message.new(message.to_h.merge(user: user))
  end
end
