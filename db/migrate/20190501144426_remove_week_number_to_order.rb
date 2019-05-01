class RemoveWeekNumberToOrder < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :week_number
    remove_column :orders, :year_number
  end
end
