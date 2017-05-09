class AddStatusToTreatmentProcess < ActiveRecord::Migration[5.0]
  def change
    add_column :treatment_processes, :status, :string
  end
end
