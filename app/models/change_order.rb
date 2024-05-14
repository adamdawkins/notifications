class ChangeOrder < ApplicationRecord
  has_many :noticed_events, as: :record, dependent: :destroy, class_name: "Noticed::Event"
  has_many :notifications, through: :noticed_events, class_name: "Noticed::Notification"

  def display_id
    "##{id.to_s.rjust(4, '0')}"
  end
end
