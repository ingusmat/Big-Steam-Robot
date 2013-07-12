class AddFieldsToUnit < ActiveRecord::Migration
  def change
    add_column :units, :jack_marshal, :boolean
  end
end
