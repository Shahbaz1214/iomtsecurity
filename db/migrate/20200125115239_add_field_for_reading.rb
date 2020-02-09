class AddFieldForReading < ActiveRecord::Migration[5.2]
  def change
  	add_column :readings, :patient_id, :integer
  end
end
