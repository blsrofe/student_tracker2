class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :grade_level
      t.text :notes
      t.string :email

      t.timestamps
    end
  end
end
