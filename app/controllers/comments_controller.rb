class CommentsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @comment = @event.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      @comment.event.create_notification_comment!(current_user, @comment.id)
      redirect_to event_path(@comment.event.id), notice: "コメントしました"
    else
      @event = Event.find(params[:event_id])
      @comments = @event.comments
      flash.now[:alert] = "コメントできませんでした"
      render "events/show"
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:content)
    end
end
