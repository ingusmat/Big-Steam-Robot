class AddPrivateToArmies < ActiveRecord::Migration
  def change
    add_column :armies, :private, :boolean
  end
end
