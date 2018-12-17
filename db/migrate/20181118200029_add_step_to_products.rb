class AddStepToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :step, :text
  end
end
