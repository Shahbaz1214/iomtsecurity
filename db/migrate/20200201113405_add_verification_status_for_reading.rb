class AddVerificationStatusForReading < ActiveRecord::Migration[5.2]
  def change
  	add_column :readings, :verification_status, :integer, default: 0
  end
end
