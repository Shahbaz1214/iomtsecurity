class AddFeedbackStatusForPatient < ActiveRecord::Migration[5.2]
  def change
  	add_column :patients, :is_read, :boolean, default: false
  end
end
