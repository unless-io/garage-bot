class CreateTreatmentProcesses < ActiveRecord::Migration[5.0]
  def change
    create_table :treatment_processes do |t|
      t.integer :client_id
      t.references :questionaire, foreign_key: true
      t.string :frequency
      t.string :duration
      t.date :start_date
      t.integer :creator_id

      t.timestamps
    end
    add_foreign_key :treatment_processes, :users, column: "client_id"
    add_foreign_key :treatment_processes, :users, column: "creator_id"
    add_index :treatment_processes, :client_id
    add_index :treatment_processes, :creator_id
  end
end
