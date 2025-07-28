class FollowRequestPolicy < ApplicationPolicy
  def index?
    user.present?
  end

  def show?
    user == record.sender || user == record.recipient
  end

  def create?
    user == record.sender
  end

  def update?
    destroy?
  end

  def destroy?
    user == record.sender || user == record.recipient
  end
end
