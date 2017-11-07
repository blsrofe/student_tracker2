class AddToneToObservations < ActiveRecord::Migration[5.1]
  def change
    add_column :observations, :tone, :string
  end
end
