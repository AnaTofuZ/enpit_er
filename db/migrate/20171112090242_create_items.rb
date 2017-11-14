class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.belongs_to :user, index:true
      t.string :food
      t.timestamps
    end
  end
end
