class AddFeedbackForPatients < ActiveRecord::Migration[5.2]
  def change
  	add_column :patients, :feedback, :text
  end
end
