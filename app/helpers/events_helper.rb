module EventsHelper
  def current_user?(user)
    user && user == current_user
  end
end
