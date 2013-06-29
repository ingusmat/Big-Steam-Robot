# == Schema Information
#
# Table name: statlines
#
#  id         :integer          not null, primary key
#  unit_id    :integer
#  speed      :integer
#  strength   :integer
#  mat        :integer
#  rat        :integer
#  defense    :integer
#  armor      :integer
#  command    :integer
#  magic      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Statline < ActiveRecord::Base
  attr_accessible :armor, :command, :defense, :magic, :mat, :rat, :speed, :strength, :unit_id
end
