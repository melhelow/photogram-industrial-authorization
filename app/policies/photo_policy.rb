class PhotoPolicy < ApplicationPolicy
  def show?
    user == record.owner || !record.owner.private? || record.owner.followers.include?(user)
  end

  def edit?
    user == record.owner
  end

  def update?
    edit?
  end

  def destroy?
    edit?
  end

  def create?
    true
  end
end
