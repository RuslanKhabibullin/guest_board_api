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
end
