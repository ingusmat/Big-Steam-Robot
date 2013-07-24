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
  attr_accessible :faction_id, :field_allowance, :hit_points, :name, :point_cost, :unit_type_id, :jack_marshall, :parent_unit_id, :max_point_cost
  has_many :army_units
  has_many :armies, :through => :army_units
  has_many :child_units, :foreign_key => 'parent_unit_id', :class_name => "Unit", dependent: :destroy
  belongs_to :parent_unit, :foreign_key => 'parent_unit_id', :class_name => "Unit"
  belongs_to :faction
  belongs_to :unit_type
end
