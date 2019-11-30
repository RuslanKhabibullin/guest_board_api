class MessagePolicy < ApplicationPolicy
  def manage?
    record.user == user
  end
end
