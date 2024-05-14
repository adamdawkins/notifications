class NotificationsController < ApplicationController
  after_action :mark_notification_as_read, only: :read
  def index
    @notifications = current_user.notifications.newest_first.includes(event: :record)
    @notifications.mark_as_seen
  end

  def read
    redirect_to params[:url]
  end

  private

  def mark_notification_as_read
    MarkNotificationAsReadJob.perform_later(params[:id]) 
  end
end
