# To deliver this notification:
#
# ChangeOrderNotifier.with(record: @change_order, message: "change to project cost").deliver(User.all)

class ChangeOrderNotifier < ApplicationNotifier
  required_param :message
 
  notification_methods do
    # I18n helpers
    def message
      params[:message]
    end
 
    # URL helpers are accessible in notifications
    # Don't forget to set your default_url_options so Rails knows how to generate urls
    def url
      change_order_path(record)
    end

    def record 
      record
    end
  end
end
