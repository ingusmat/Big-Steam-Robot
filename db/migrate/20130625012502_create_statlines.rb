class CreateStatlines < ActiveRecord::Migration
  def change
    create_table :statlines do |t|
      t.integer :unit_id
      t.integer :speed
      t.integer :strength
      t.integer :mat
      t.integer :rat
      t.integer :defense
      t.integer :armor
      t.integer :command
      t.integer :magic

      t.timestamps
    end
  end
end
