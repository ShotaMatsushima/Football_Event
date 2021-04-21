class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_events = @user.events.all.order(created_at: :desc).page(params[:page]).per(10)
    @participaton_events = @user.participaton_events.order(created_at: :desc).page(params[:page]).per(10)
  end
end
