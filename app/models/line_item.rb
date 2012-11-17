# == Schema Information
#
# Table name: line_items
#
#  id         :integer          not null, primary key
#  unit_price :decimal(, )
#  track_id   :integer
#  cart_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class LineItem < ActiveRecord::Base
	attr_accessible :cart, :track, :unit_price

	belongs_to :cart
	belongs_to :track

	def full_price
		unit_price
	end
end
