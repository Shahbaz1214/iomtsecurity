class AddFeedbackStatusForPatient < ActiveRecord::Migration
  def change
  	add_column :patients, :is_read, :boolean, default: false
  end
end
