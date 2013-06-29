class AddArmyUnits < ActiveRecord::Migration
  def change
    drop_table :armies_units

    create_table :army_units do |t|
      t.references :army, :unit
    end

    add_index :army_units, [:army_id, :unit_id]
  end
end
