class AddFeedbackForPatients < ActiveRecord::Migration
  def change
  	add_column :patients, :feedback, :text
  end
end
