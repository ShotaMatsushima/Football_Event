module NotificationsHelper
  def notification_form(notification)
    @visiter = notification.visiter
    @comment = nil
    @visiter_comment = notification.comment_id
    # notification.actionがlikeかcommentか
    case notification.action
      when "participation" then
        tag.a(notification.visiter.name, href:user_path(@visiter), style:"font-weight: bold;")+"が"+tag.a('あなたのイベント', href:event_path(notification.event_id), style:"font-weight: bold;")+"に参加しました"
      when "like" then
        tag.a(notification.visiter.name, href:user_path(@visiter), style:"font-weight: bold;")+"が"+tag.a('あなたのイベント', href:event_path(notification.event_id), style:"font-weight: bold;")+"にいいねしました"
      when "comment" then
        @comment = Comment.find_by(id: @visiter_comment)&.content
        tag.a(@visiter.name, href:user_path(@visiter), style:"font-weight: bold;")+"が"+tag.a('あなたのイベント', href:event_path(notification.event_id), style:"font-weight: bold;")+"にコメントしました"
    end
  end

  def unchecked_notifications
    @notifications = current_user.passive_notifications.where(checked: false)
  end
end
