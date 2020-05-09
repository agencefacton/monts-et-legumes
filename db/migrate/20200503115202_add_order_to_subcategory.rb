 class AddOrderToSubcategory < ActiveRecord::Migration[5.2]
  def change
    add_column :subcategories, :order, :integer
  end
end
