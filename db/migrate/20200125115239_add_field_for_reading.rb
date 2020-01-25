class AddFieldForReading < ActiveRecord::Migration
  def change
  	add_column :readings, :patient_id, :integer
  end
end
