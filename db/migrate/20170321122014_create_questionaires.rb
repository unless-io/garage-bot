class CreateQuestionaires < ActiveRecord::Migration[5.0]
  def change
    create_table :questionaires do |t|
      t.string :title
      t.text :instruction

      t.timestamps
    end
  end
end
