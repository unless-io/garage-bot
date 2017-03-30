class CreateQuestionOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :question_options do |t|
      t.string :content
      t.belongs_to :question, foreign_key: true

      t.timestamps
    end
  end
end
