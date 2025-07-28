class UsersController < ApplicationController
  before_action :set_user, only: %i[ show liked feed discover ]
before_action :authorize_user_with_pundit, only: [:feed, :discover, :liked]

  def index
    @users = @q.result
  end

  def show
  authorize @user
  
end
  def pending
  @user = User.find_by(username: params[:username])
  authorize @user
  # Add authorization check
  if current_user != @user
    redirect_back(
      fallback_location: root_path,
      alert: "You can only view your own pending requests"
    )
    return
  end
  
  @pending_requests = @user.pending_received_follow_requests
end

def authorize_user_with_pundit
  authorize @user, "#{action_name}?".to_sym
end
  private

    def set_user
      if params[:username]
        @user = User.find_by!(username: params.fetch(:username))
      else
        @user = current_user
      end
    end

  #   def authorize_user_access
  #   return if current_user == @user
    
  #   redirect_back(
  #     fallback_location: root_path,
  #     alert: "You're not authorized for that."
  #   )
  # end
end
