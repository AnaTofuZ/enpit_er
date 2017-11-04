class AddProfilesToProfile < ActiveRecord::Migration[5.1]
  def change
    change_table :profiles do |t|
      t.integer :sex
      t.date :birthday, index: true
      t.string :job,index: true 
      t.string :hobby, 
      t.string :job, 
  end
end
