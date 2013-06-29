class AddArmiesUnits < ActiveRecord::Migration
  def change
    create_table :armies_units, :id => false do |t|
      t.references :army, :unit
    end

    add_index :armies_units, [:army_id, :unit_id]
  end
end
