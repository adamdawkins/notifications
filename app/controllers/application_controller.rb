class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  after_action :mark_notification_as_read

  private

  def mark_notification_as_read
    MarkNotificationAsReadJob.perform_later(params[:read_notification_id]) if params[:read_notification_id].present?
  end
end
