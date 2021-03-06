class AddProfilesToProfile < ActiveRecord::Migration[5.1]
  def change
    change_table :profiles do |t|
      t.integer  :sex ,    default: 1,null: false, limit: 1
      t.date     :birthday,default: '1997-01-01',null: false, index: true
      t.string   :job,     index: true
      t.string   :hobby,   index: true
      t.string   :purpose, index: true
    end
  end
end
