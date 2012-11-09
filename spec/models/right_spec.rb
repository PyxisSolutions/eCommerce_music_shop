# == Schema Information
#
# Table name: rights
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  controller :string(255)
#  action     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Right do
  pending "add some examples to (or delete) #{__FILE__}"
end
