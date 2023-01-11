class Order < ApplicationRecord
  belongs_to :user
  has_many :order_details, dependent: :destroy

  enum payment_method: {credit_card: 0, transfer: 1}

   def address_display
    '〒'+postal_code+' '+adress+' '+first_name+last_name
   end
end
