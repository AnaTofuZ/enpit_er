class ChangeDatatypeProfilesOfBirthday < ActiveRecord::Migration[5.1]
  def up
      change_column :profiles, :birthday, :date, null: false, default: '1997-01-1',index: true
  end

  def down
      change_column :profiles, :birthday, :date, null: false, default: 1,index: true
  end
end
