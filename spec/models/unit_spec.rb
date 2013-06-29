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

require 'spec_helper'

describe Unit do
  pending "add some examples to (or delete) #{__FILE__}"
end
