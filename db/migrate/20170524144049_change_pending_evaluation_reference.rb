class ChangePendingEvaluationReference < ActiveRecord::Migration[5.0]
  def change
    remove_reference :pending_evaluations, :questionaire, index: true, foreign_key: true
    add_reference :pending_evaluations, :treatment_process, index: true, foreign_key: true
  end
end
