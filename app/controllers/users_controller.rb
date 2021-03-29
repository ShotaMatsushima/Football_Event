class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @participaton_events = @user.participaton_events
  end
end
