class Address < ApplicationRecord
  belongs_to :user

  def address_display
    '〒'+postal_code+''+adress+''+first_name+last_name
  end
end
