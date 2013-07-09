class FixAttachmentsTableAgain < ActiveRecord::Migration
  def change
    drop_table :attachments

    create_table :attachments do |t|
      t.integer :army_unit_id
      t.integer :attached_unit_id

      t.timestamps
    end
    add_index :attachments, [:army_unit_id, :attached_unit_id]

  end
end
