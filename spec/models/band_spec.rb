# == Schema Information
#
# Table name: bands
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  account_id :integer
#  bio        :text
#

require 'spec_helper'

describe Band do
  pending "add some examples to (or delete) #{__FILE__}"
end
