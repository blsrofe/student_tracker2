class CreateObservations < ActiveRecord::Migration[5.1]
  def change
    create_table :observations do |t|
      t.string :subject
      t.string :type
      t.text :comment
      t.date :date
      t.boolean :parent_viewable, default: false
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
