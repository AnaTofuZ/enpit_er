class AddUidIndexsToUsers < ActiveRecord::Migration[5.1]
  def change
    change_table :users do |t|
      t.string :uid
      t.string :provider
      t.string :location
      t.string :nickname
      t.binary :image
    end
    add_index :users, [:uid, :provider], unique: true
  end
end
