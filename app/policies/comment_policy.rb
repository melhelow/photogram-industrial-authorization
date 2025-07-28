class CommentPolicy < ApplicationPolicy
  def create?
    true
  end

  def destroy?
    user == record.author || user == record.photo.owner
  end

  def update?
    user == record.author
  end

  def edit?
    update?
  end
end
