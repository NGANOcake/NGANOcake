class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      t.integer :item_id
      t.integer :customer_id #user_idに変更が必要
      t.integer :amount

      t.timestamps
    end
  end
end
