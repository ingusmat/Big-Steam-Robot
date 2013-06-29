# == Schema Information
#
# Table name: factions
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  game_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Faction < ActiveRecord::Base
  attr_accessible :game_id, :name
end
