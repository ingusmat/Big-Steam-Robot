class CreateDamageGrids < ActiveRecord::Migration
  def change
    create_table :damage_grids do |t|
      t.integer :unit_id
      t.string :grid

      t.timestamps
    end
  end
end
