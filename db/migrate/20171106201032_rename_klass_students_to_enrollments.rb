class RenameKlassStudentsToEnrollments < ActiveRecord::Migration[5.1]
  def change
    rename_table :klass_students, :enrollments
  end
end
