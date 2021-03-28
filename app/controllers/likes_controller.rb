class LikesController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    like = current_user.likes.build(event_id: params[:event_id])
    if like.save
      redirect_to event_path(like.event.id)
      event = Event.find(params[:event_id])
      event.create_notification_like!(current_user)
    else
      render "events/new"
    end
  end

  def destroy
    @event = Event.find(params[:event_id])
    like = Like.find_by(event_id: params[:event_id], user_id: current_user.id)
    if like.destroy
      redirect_to event_path(like.event.id)
    else
      render "events/new"
    end
  end
end
