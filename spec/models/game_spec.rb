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

require 'spec_helper'

describe Game do
  pending "add some examples to (or delete) #{__FILE__}"
end
