class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.references :question, foreign_key: true
      t.references :evaluation, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
