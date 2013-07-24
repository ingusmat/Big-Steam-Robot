class MakeNewAttachmentsTableWithParentAndChild < ActiveRecord::Migration
  def change
    drop_table :attachments

    create_table :attachments do |t|
      t.integer :parent_army_unit_id
      t.integer :child_army_unit_id

      t.timestamps
    end
    add_index :attachments, [:parent_army_unit_id, :child_army_unit_id]

  end
end
