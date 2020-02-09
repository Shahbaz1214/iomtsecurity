class CreateReadings < ActiveRecord::Migration[5.2]
  def change
    create_table :readings do |t|
      t.string :reading_value

      t.timestamps null: false
    end
  end
end
