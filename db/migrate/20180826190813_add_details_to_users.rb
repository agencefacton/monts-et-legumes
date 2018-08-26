class AddDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone_number, :string
    add_column :users, :mayeres, :boolean
    add_column :users, :tab, :decimal
    add_column :users, :admin, :boolean
  end
end
