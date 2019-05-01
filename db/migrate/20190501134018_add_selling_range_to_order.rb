class AddSellingRangeToOrder < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders, :selling_range, foreign_key: true
  end
end
