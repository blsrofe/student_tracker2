class CreateStudentParents < ActiveRecord::Migration[5.1]
  def change
    create_table :student_parents do |t|
      t.references :student, foreign_key: true
      t.references :parent, foreign_key: true
    end
  end
end
