# == Schema Information
#
# Table name: units
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  faction_id      :integer
#  point_cost      :integer
#  field_allowance :string(255)
#  hit_points      :integer
#  unit_type_id    :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Unit < ActiveRecord::Base
  attr_accessible :faction_id, :field_allowance, :hit_points, :name, :point_cost, :unit_type_id
  has_many :army_units
  has_many :armies, :through => :army_units
  belongs_to :unit_type
end
