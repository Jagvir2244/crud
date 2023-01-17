class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.integer :roll_no
      t.string :phone
      t.string :email
      t.boolean :active
      t.string :class_name

      t.timestamps
    end
  end
end
