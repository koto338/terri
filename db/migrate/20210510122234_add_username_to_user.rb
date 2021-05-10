class AddUsernameToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :username, :string, :unique => true, :null => false, :default => ""
    add_column :users, :image, :string
  end
end
