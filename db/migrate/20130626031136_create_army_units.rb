class CreateArmyUnits < ActiveRecord::Migration
  def change
    drop_table :army_units
    create_table :army_units do |t|
      t.integer :army_id
      t.integer :unit_id

      t.timestamps
    end
  end
end
