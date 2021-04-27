class CommentsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @comment = @event.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment_event = @comment.event
    if @comment.save
      @comment_event.create_notification_comment!(current_user, @comment.id)
      render "index"
    else
      render "events/show"
    end

    def destroy
      @comment = Comment.find(params[:id])
      render "index" if @comment.destroy
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:content)
    end
end
