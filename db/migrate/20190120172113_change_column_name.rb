class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :orders, :current_year, :year_number
  end
end
