class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @user_events = @user.events.all.order(created_at: :desc).page(params[:page]).per(10)
    @participaton_events = @user.participaton_events.order(created_at: :desc).page(params[:page]).per(10)
  end

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.followings.page(params[:page]).per(10)
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.page(params[:page]).per(10)
    render 'show_follow'
  end
end
