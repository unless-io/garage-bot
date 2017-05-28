class AddViewedToEvaluation < ActiveRecord::Migration[5.0]
  def change
    add_column :evaluations, :viewed, :boolean, default: false
  end
end
