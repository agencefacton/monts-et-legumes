class CreateSellingRanges < ActiveRecord::Migration[5.2]
  def change
    create_table :selling_ranges do |t|
      t.datetime :starts_at
      t.datetime :ends_at

      t.timestamps
    end
  end
end
