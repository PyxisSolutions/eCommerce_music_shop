# == Schema Information
#
# Table name: purchases
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  track_id   :integer
#

class Purchase < ActiveRecord::Base
	attr_accessible :track_id
	belongs_to :user
	belongs_to :track
end
