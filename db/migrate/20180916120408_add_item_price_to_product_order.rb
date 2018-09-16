class AddItemPriceToProductOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :product_orders, :item_price, :decimal
  end
end
