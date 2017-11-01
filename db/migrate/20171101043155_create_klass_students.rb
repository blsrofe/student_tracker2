class CreateKlassStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :klass_students do |t|
      t.references :student, foreign_key: true
      t.references :klass, foreign_key: true

      t.timestamps
    end
  end
end
