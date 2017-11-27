class CreateCommunityCounters < ActiveRecord::Migration[5.1]
  def change
    create_table :community_counters do |t|
      t.integer :counter, default: 0

      t.timestamps
    end
  end
end
