class CreatePendingEvaluations < ActiveRecord::Migration[5.0]
  def change
    create_table :pending_evaluations do |t|
      t.references :questionaire, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :progress, default: 0
      t.timestamps
    end
  end
end
