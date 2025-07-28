class UserPolicy < ApplicationPolicy
  def show?
    true  # Everyone can view profiles
  end

  def show_photos?
    user == record || !record.private? || record.followers.include?(user)
  end

  def feed?
    user == record
  end

  def discover?
    user == record
  end

  def liked?
    user == record
  end
end
