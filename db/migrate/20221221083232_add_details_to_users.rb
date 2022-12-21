class AddDetailsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :first_name_kana, :string
    add_column :users, :last_name_kana, :string
    add_column :users, :postal_code, :string
    add_column :users, :address, :string
    add_column :users, :telephon_number, :string
    add_column :users, :is_deleted, :boolean
  end
end
