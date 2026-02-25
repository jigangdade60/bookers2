class RelationshipsController < ApplicationController
  before_action :set_user

  def create
    Current.user.follow(@user)
	  redirect_to request.referer
  end
  
  def destroy
    Current.user.unfollow(@user)
	redirect_to request.referer
  end
  
  def followings
	@followings = @user.followings
  end

  def followers
	@followers = @user.followers
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
