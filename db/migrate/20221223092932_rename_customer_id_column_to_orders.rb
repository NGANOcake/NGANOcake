class RenameCustomerIdColumnToOrders < ActiveRecord::Migration[6.1]
  def change
    rename_column :orders, :customer_id, :user_id
  end
end
