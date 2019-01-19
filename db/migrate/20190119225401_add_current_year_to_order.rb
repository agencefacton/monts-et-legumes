class AddCurrentYearToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :current_year, :integer
  end
end
