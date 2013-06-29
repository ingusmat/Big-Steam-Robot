class CreateArmies < ActiveRecord::Migration
  def up
    create_table :armies do |t|
      t.string :name
      t.integer :user_id
      t.integer :points
      t.integer :faction_id
      t.timestamps
    end
  end

  def down
  end
end
