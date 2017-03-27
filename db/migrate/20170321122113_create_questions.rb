class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.references :questionaire, foreign_key: true
      t.string :category
      t.text :content

      t.timestamps
    end
  end
end
