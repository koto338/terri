class AddNameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :delete_flag, :boolean
  end
end
