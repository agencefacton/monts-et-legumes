class CreateTabs < ActiveRecord::Migration[5.2]
  def change
    create_table :tabs do |t|
      t.boolean :add
      t.decimal :amount
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
