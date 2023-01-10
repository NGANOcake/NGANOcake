class CartItem < ApplicationRecord
  belongs_to :user
  belongs_to :item

   has_one_attached :image

   def taxin_price
     item.price*1.1
   end

  def sum_price
    item.taxin_price * amount
  end

  def get_image
    if image.attached?
      image
    else
      'no_image.jpg'
    end
  end
end
