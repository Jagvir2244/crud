class CreatePhones < ActiveRecord::Migration[7.0]
  def change
    create_table :phones do |t|
      t.string :name
      t.string :color
      t.boolean :active
      t.integer :price

      t.timestamps
    end
  end
end
