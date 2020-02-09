class AddRoleForUsers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :role, :integer
  	add_column :patients, :age, :integer
  end
end
