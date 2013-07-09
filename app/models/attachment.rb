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
  attr_accessible :army_unit_id, :unit_id

  belongs_to :army_unit
  belongs_to :unit
end
