# == Schema Information
#
# Table name: army_units
#
#  id         :integer          not null, primary key
#  army_id    :integer
#  unit_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ArmyUnit < ActiveRecord::Base
  attr_accessible :army_id, :unit_id
  belongs_to :unit
  belongs_to :army
  has_many :attachments, foreign_key: 'parent_army_unit_id', dependent: :destroy
  has_many :parent_army_units, :through => :attachments, :class_name => "ArmyUnit"
  has_many :child_army_units, :through => :attachments, :class_name => "ArmyUnit", dependent: :destroy
end
