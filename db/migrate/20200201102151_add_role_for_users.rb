class AddRoleForUsers < ActiveRecord::Migration
  def change
  	add_column :users, :role, :integer
  	add_column :patients, :age, :integer
  end
end
