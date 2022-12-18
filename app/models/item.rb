class Item < ApplicationRecord
  belongs_to :genre, optional: true
  has_many :cart_items
  has_many :order_details

  has_one_attached :image
end
