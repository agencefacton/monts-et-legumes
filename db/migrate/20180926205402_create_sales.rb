class CreateSales < ActiveRecord::Migration[5.2]
  def change
    create_table :sales do |t|
      t.integer :week_number
      t.integer :quantity
      t.decimal :item_price
      t.references :product, foreign_key: true
      t.boolean :mayeres

      t.timestamps
    end
  end
end
