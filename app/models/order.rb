class Order < ApplicationRecord
  belongs_to :user
  has_many :order_details

  enum payment_method: {credit_card: 0, transfer: 1}

   def address_display
    '〒'+postal_code+' '+address
   end
end
