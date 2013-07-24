class AddParentUnitIdAndMaxPointCostToUnits < ActiveRecord::Migration
  def change
    add_column :units, :parent_unit_id, :integer
    add_column :units, :max_point_cost, :integer
  end
end
