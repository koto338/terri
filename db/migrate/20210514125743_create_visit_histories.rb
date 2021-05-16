class CreateVisitHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :visit_histories do |t|
      t.string :customer
      t.text :appointment
      t.text :visit
      t.text :contract
      t.text :note
      t.references :user, foreign_key: true
      t.references :area, foreign_key: true

      t.timestamps
    end
  end
end
