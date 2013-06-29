class RepairArmyUnits < ActiveRecord::Migration
  def change
    drop_table :army_units
    create_table :army_units do |t|
      t.belongs_to :army
      t.belongs_to :unit
      t.timestamps
    end
  end
end
