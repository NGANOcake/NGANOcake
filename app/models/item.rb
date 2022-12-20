class Item < ApplicationRecord
  belongs_to :genre, optional: true
  has_many :cart_items
  has_many :order_details

  has_one_attached :image

  def get_image
    if image.attached?
      image
    else
      'no_image.jpg'
    end
  end
end
