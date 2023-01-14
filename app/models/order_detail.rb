class OrderDetail < ApplicationRecord
  belongs_to :item
  belongs_to :order

   def taxin_price
    price * 1.1
   end
end
