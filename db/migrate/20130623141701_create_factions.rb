class CreateFactions < ActiveRecord::Migration
  def change
    create_table :factions do |t|
      t.string :name
      t.integer :game_id

      t.timestamps
    end
  end
end
