class ChangeReferenceForEvaluation < ActiveRecord::Migration[5.0]
  def change
    remove_reference :evaluations, :questionaire, index: true, foreign_key: true
    add_reference :evaluations, :treatment_process, index: true, foreign_key: true
  end
end
