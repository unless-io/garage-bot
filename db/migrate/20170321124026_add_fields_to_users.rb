class AddFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :admin, :boolean, default: false
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :facebook_id, :integer, limit: 8
    add_column :users, :coach_id, :integer

    add_foreign_key :users, :users, column: "coach_id"
    add_index :users, :coach_id

  end
end
