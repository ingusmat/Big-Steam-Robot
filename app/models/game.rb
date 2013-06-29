# == Schema Information
#
# Table name: games
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  magic_name  :string(255)
#  caster_name :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Game < ActiveRecord::Base
  attr_accessible :caster_name, :magic_name, :name
end
