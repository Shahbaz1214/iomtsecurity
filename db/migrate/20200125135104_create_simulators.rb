class CreateSimulators < ActiveRecord::Migration
  def change
    create_table :simulators do |t|
      t.integer :patient_id

      t.timestamps null: false
    end
  end
end
