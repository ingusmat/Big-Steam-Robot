# == Schema Information
#
# Table name: attachments
#
#  id               :integer          not null, primary key
#  army_unit_id     :integer
#  attached_unit_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Attachment < ActiveRecord::Base
  attr_accessible :parent_army_unit_id, :child_army_unit_id

  belongs_to :parent_army_unit, foreign_key: 'parent_army_unit_id', class_name: 'ArmyUnit'

  belongs_to :child_army_unit, foreign_key: 'child_army_unit_id', class_name: 'ArmyUnit', dependent: :destroy
end
