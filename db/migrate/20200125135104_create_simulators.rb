class CreateSimulators < ActiveRecord::Migration[5.2]
  def change
    create_table :simulators do |t|
      t.integer :patient_id

      t.timestamps null: false
    end
  end
end
