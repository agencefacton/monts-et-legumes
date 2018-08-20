class AddEditableToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :editable, :boolean
  end
end
