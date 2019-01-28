class RenameTabModel < ActiveRecord::Migration[5.2]
  def change
    rename_table :tabs, :transactions
  end
end
