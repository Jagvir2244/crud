class CreateBegs < ActiveRecord::Migration[7.0]
  def change
    create_table :begs do |t|
      t.string :brand
      t.string :color
      t.integer :price
      t.boolean :active
      t.integer :size

      t.timestamps
    end
  end
end
