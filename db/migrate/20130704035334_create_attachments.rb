class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.integer :parent_unit_id
      t.integer :child_unit_id

      t.timestamps
    end
    add_index :attachments, [:parent_unit_id, :child_unit_id]
  end
end
