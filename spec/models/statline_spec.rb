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

require 'spec_helper'

describe Statline do
  pending "add some examples to (or delete) #{__FILE__}"
end
