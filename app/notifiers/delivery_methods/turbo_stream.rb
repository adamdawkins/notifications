class DeliveryMethods::TurboStream < ApplicationDeliveryMethod
  # Specify the config options your delivery method requires in its config block
  # required_options # :foo, :bar

  def deliver
    return unless recipient.is_a?(User)

    notification.broadcast_update_to_bell
  end
end
