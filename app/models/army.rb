# == Schema Information
#
# Table name: armies
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  user_id    :integer
#  points     :integer
#  faction_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  private    :boolean
#

class Army < ActiveRecord::Base
  attr_accessible :faction_id, :name, :points, :user_id, :private
  belongs_to :user
  belongs_to :faction
  has_many :army_units, dependent: :destroy
  has_many :units, through: :army_units
end
