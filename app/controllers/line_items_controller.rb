class LineItemsController < ApplicationController
	def create
		@track = Track.find(params[:track_id])

		# current_cart.line_items.each do |line_item|
		# 	if line_item.track == @track
		# 		flash[:error] = "Song already in cart..."
		# 		# redirect_to :back
		# 	end
		# end
		if already_in_cart?(@track)
			flash[:error] = "Song already in cart..."
		else
			@line_item = LineItem.create!(:cart => current_cart, :track => @track, :unit_price => @track.price)
			flash[:notice] = "Added #{@track.name} to cart"
		end
		redirect_to :back
	end

	def already_in_cart?(track)
		current_cart.line_items.each do |line_item|
			if line_item.track == track
				return true
			end
		end
		return false
	end

end