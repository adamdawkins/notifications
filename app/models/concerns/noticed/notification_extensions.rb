# app/models/concerns/noticed/notification_extensions.rb

module Noticed::NotificationExtensions
  extend ActiveSupport::Concern

  def broadcast_update_to_bell
    broadcast_update_to(
      "notifications_#{recipient.id}",
      target: "notification_bell",
      partial: "navbar/notifications/bell",
      locals: { count: recipient.reload.notifications_count, refresh: true }
    )
  end

  def broadcast_prepend_to_index_list
    broadcast_prepend_to(
      "notifications_index_list_#{recipient.id}",
      target: "notifications",
      partial: "notifications/notification",
      locals: { notification: self }
    )
  end
end
