class NotificationsController < ApplicationController
  def index
    @notifications = current_user.notifications.newest_first.includes(event: :record)
  end
end
