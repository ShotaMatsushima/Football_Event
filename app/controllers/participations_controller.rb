class ParticipationsController < ApplicationController
  def create
    participation = current_user.participations.build(event_id: params[:event_id])
    participation.save
    redirect_to event_path(participation.event.id), notice: "イベントに参加しました"
  end

  def destroy
    participation = Participation.find_by(event_id: params[:event_id], user_id: current_user.id)
    participation.destroy
    redirect_to event_path(participation.event.id), alert: "イベントの参加を取り消しました"
  end
end
