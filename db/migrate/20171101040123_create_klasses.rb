class CreateKlasses < ActiveRecord::Migration[5.1]
  def change
    create_table :klasses do |t|
      t.string :title
      t.string :school_year
      t.string :description
      t.references :user, foreign_key: true
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
