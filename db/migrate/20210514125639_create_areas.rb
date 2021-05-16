class CreateAreas < ActiveRecord::Migration[5.1]
  def change
    create_table :areas do |t|
      t.string :ward, null: false
      t.string :town, null: false
      t.string :city_block, null: false
      t.integer :status, null: false

      t.timestamps
    end
  end
end
