class CreateCheckpoints < ActiveRecord::Migration[5.0]
  def change
    create_table :checkpoints do |t|
      t.references :treatment_process, foreign_key: true
      t.date :scheduled_day

      t.timestamps
    end
  end
end
