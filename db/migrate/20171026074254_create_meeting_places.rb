class CreateMeetingPlaces < ActiveRecord::Migration[5.1]
  def change
    create_table :meeting_places do |t|
      t.belongs_to :user, index: true
      t.integer :place_id

      t.timestamps
    end
  end
end
