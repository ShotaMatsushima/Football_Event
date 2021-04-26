class LikesController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    like = current_user.likes.build(event_id: params[:event_id])
    like.save
    event = Event.find(params[:event_id])
    event.create_notification_like!(current_user)
  end

  def destroy
    @event = Event.find(params[:event_id])
    like = Like.find_by！(event_id: params[:event_id], user_id: current_user.id)
    like.destroy
  end
end
