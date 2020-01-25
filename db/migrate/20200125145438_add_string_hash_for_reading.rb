class AddStringHashForReading < ActiveRecord::Migration
  def change
  	add_column :readings, :blockchain_hash, :string
  end
end
