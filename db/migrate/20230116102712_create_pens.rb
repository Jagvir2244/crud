class CreatePens < ActiveRecord::Migration[7.0]
  def change
    create_table :pens do |t|
      t.string :name
      t.string :color
      t.boolean :active
      t.integer :price

      t.timestamps
    end
  end
end
