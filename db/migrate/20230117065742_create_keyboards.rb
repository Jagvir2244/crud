class CreateKeyboards < ActiveRecord::Migration[7.0]
  def change
    create_table :keyboards do |t|
      t.string :brand
      t.integer :price
      t.string :discount
      t.string :discription
      t.boolean :active
      t.string :color

      t.timestamps
    end
  end
end
