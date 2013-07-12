class AddJackMarshallToUnit < ActiveRecord::Migration
  def change
    remove_column :units, :jack_marshal
    add_column :units, :jack_marshall, :boolean
  end
end
