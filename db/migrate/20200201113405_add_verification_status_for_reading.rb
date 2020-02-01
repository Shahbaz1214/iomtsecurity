class AddVerificationStatusForReading < ActiveRecord::Migration
  def change
  	add_column :readings, :verification_status, :integer, default: 0
  end
end
