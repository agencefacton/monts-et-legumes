class RemoveStepFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :step
  end
end
