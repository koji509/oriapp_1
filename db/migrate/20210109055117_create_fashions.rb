class CreateFashions < ActiveRecord::Migration[6.0]
  def change
    create_table :fashions do |t|
      t.string :artist,   null: false
      t.text :brand,      null: false
      t.text :item,       null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
