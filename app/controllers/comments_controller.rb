class CommentsController < ApplicationController
  def create
    event = Event.find(params[:event_id])
    @comment = event.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to event_path(@comment.event.id), notice: "コメントしました"
    else
      redirect_to event_path(@comment.event.id), alert: "コメントできませんでした"
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:content)
    end
end
