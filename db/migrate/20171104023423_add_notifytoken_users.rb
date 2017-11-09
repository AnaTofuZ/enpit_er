class AddNotifytokenUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :notifytoken,:string
  end
end
