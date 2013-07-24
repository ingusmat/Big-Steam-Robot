class AddMaxUnitToArmyUnits < ActiveRecord::Migration
  def change
    add_column :army_units, :max_unit, :boolean
  end
end
