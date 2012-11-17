# == Schema Information
#
# Table name: carts
#
#  id           :integer          not null, primary key
#  purchased_at :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Cart < ActiveRecord::Base
	has_many :line_items

	def total_price
		line_items.to_a.sum(&:full_price)
	end

	# def paypal_url
	# 	values = {
	#       	:business => 'seller_1229899173_biz@railscasts.com',
	#       	:cmd => '_cart',
	#       	:upload => 1,
	#       	:return => return_url,
	#      	:invoice => id
 #    	}
 #    	line_items.each_with_index do |item, index|
 #      		values.merge!({
 #        		"amount_#{index+1}" => item.unit_price,
	# 	        "item_name_#{index+1}" => item.product.name,
	# 	        "item_number_#{index+1}" => item.id,
	# 	        "quantity_#{index+1}" => item.quantity
 #      		})
 #    	end
 #    	"https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
	# end

end
