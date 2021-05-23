module NotificationsHelper
  def notification_form(notification)
    visiter = notification.visiter
    @comment = nil
    visiter_comment = notification.comment_id
    # notification.actionがlikeかcommentかparticipation
    case notification.action
    when NOTIFICATION_ACTION[:participation]
      tag.a(notification.visiter.name, href: user_path(visiter), style: "font-weight: bold;") + "が" +
      tag.a('あなたのイベント', href: event_path(notification.event_id), style: "font-weight: bold;") + "に参加しました"
    when NOTIFICATION_ACTION[:like]
      tag.a(notification.visiter.name, href: user_path(visiter), style: "font-weight: bold;") + "が" +
      tag.a('あなたのイベント', href: event_path(notification.event_id), style: "font-weight: bold;") + "にいいねしました"
    when NOTIFICATION_ACTION[:comment]
      @comment = Comment.find_by(id: visiter_comment)&.content
      tag.a(visiter.name, href: user_path(visiter), style: "font-weight: bold;") + "が" +
      tag.a('あなたのイベント', href: event_path(notification.event_id), style: "font-weight: bold;") + "にコメントしました"
    when NOTIFICATION_ACTION[:follow]
      tag.a(notification.visiter.name, href: user_path(visiter), style: "font-weight: bold;") + "が" +
      tag.a('あなた', href: user_path(current_user.id), style: "font-weight: bold;") + "をフォローしました"
    end
  end

  def unchecked_notifications
    current_user.passive_notifications.where(checked: false)
  end
end
