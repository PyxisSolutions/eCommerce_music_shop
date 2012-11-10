# == Schema Information
#
# Table name: bands
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  account_id :integer
#

class Band < ActiveRecord::Base
  attr_accessible :name
  belongs_to :account

    validates	:name,	:presence => true,
  						:length => { :maximum => 255 }
end
