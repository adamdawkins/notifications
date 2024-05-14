class User < ApplicationRecord
  has_many :notifications, as: :recipient, class_name: "Noticed::Notification"

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  scope :rpc, -> { where(rpc: true) }
  scope :finance, -> { where(finance: true) }
  scope :pii, -> { where(pii: true) }

end
