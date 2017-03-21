class CreateEvaluations < ActiveRecord::Migration[5.0]
  def change
    create_table :evaluations do |t|
      t.references :user, foreign_key: true
      t.references :questionaire, foreign_key: true

      t.timestamps
    end
  end
end
