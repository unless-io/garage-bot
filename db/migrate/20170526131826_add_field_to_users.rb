class AddFieldToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :conversation_accepted, :boolean, default: false
  end
end
