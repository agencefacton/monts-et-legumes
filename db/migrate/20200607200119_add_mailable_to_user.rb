class AddMailableToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :mailable, :boolean
  end
end
