class AddDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone_number, :string
    add_column :users, :mayeres, :boolean, default: false
    add_column :users, :tab, :decimal, default: 0
    add_column :users, :admin, :boolean, default: false
  end
end
