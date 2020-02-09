class AddStringHashForReading < ActiveRecord::Migration[5.2]
  def change
  	add_column :readings, :blockchain_hash, :string
  end
end
