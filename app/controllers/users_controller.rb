class UsersController < ApplicationController
  before_action :set_user, only: %i[ show liked feed discover ]
   before_action :authorize_user_access, only: [:feed, :discover, :liked]

  def index
    @users = @q.result
  end

  private

    def set_user
      if params[:username]
        @user = User.find_by!(username: params.fetch(:username))
      else
        @user = current_user
      end
    end

    def authorize_user_access
    return if current_user == @user
    
    redirect_back(
      fallback_location: root_path,
      alert: "You're not authorized for that."
    )
  end
end
