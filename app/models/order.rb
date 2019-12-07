class Order < ApplicationRecord
  validates :address, :city, :state, :card_number, :card_code,  presence: true

  belongs_to :listing
  belongs_to :buyer, class_name: "User"
  belongs_to :seller, class_name: "User"
end
