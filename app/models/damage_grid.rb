# == Schema Information
#
# Table name: damage_grids
#
#  id         :integer          not null, primary key
#  unit_id    :integer
#  grid       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class DamageGrid < ActiveRecord::Base
  attr_accessible :grid, :unit_id
end
