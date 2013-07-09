class RemoveArmyUnitsAddUnitsToAttachments < ActiveRecord::Migration
  def change
    drop_table :attachments

    create_table :attachments do |t|
      t.integer :army_unit_id
      t.integer :unit_id

      t.timestamps
    end
    add_index :attachments, [:army_unit_id, :unit_id]

  end
end
