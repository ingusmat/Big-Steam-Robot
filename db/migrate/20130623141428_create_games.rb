class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.string :magic_name
      t.string :caster_name

      t.timestamps
    end
  end
end
