class CartItem < ApplicationRecord
  belongs_to :user
  belongs_to :item

  def sum_price
    item.taixin_price * amount
  end
end
