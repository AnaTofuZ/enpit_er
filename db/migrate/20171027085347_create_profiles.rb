class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.belongs_to :user, index:true
      t.integer :place_id
      t.date :birthday
      t.timestamps
    end
  end
end
