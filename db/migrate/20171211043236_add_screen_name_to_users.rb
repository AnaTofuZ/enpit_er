class AddScreenNameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :screen_name, :string
    add_index :users, :screen_name, unique: true
  end
end
