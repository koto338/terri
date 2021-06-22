class AddColumnAreas < ActiveRecord::Migration[5.1]
  change_table :areas do |t|
    t.references :user, foreign_key: true
  end
end
