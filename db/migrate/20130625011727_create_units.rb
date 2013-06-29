class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.string :name
      t.integer :faction_id
      t.integer :point_cost
      t.string :field_allowance
      t.integer :hit_points
      t.integer :unit_type_id

      t.timestamps
    end
  end
end
