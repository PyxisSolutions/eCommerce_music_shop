# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  account_id :integer
#

class User < ActiveRecord::Base
	attr_accessible :name
	belongs_to :account,	:dependent => :destroy

	has_many :purchases
	has_many :tracks, :through => :purchases

	validates	:name,	:presence => true,
						:length => { :maximum => 50 }
end
