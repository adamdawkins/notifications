# To deliver this notification:
#
# ChangeOrderNotifier.with(record: @change_order, message: "change to project cost").deliver(User.all)

class ChangeOrderNotifier < ApplicationNotifier
     required_param :message
end
