class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  scope :rpc, -> { where(rpc: true) }
  scope :finance, -> { where(finance: true) }
  scope :pii, -> { where(pii: true) }
end
