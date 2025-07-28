class FollowRequestPolicy < ApplicationPolicy
  def show?
    user == record.sender || user == record.recipient
  end

  def update?
    user == record.recipient
  end

  def destroy?
    user == record.sender || user == record.recipient
  end

  def create?
    true
  end

  class Scope < Scope
    def resolve
      scope.where("sender_id = ? OR recipient_id = ?", user.id, user.id)
    end
  end
end
