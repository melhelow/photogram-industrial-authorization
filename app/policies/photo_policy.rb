class PhotoPolicy < ApplicationPolicy
  def show?
    return true if user == record.owner
    return true unless record.owner.private?
    record.owner.followers.include?(user)
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

  class Scope < Scope
    def resolve
      if user.nil?
        scope.joins(:owner).where(users: { private: false }) # guests see only public users’ photos
      else
        scope.select do |photo|
          PhotoPolicy.new(user, photo).show?
        end
      end
    end
  end
end
