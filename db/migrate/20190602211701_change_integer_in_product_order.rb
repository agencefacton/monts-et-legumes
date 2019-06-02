class ChangeIntegerInProductOrder < ActiveRecord::Migration[5.2]
  def change
    change_column :product_orders, :quantity, :float
  end
end
