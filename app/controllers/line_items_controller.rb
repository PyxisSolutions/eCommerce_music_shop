class LineItemsController < ApplicationController
	def create
		@track = Track.find(params[:track_id])
		@line_item = LineItem.create!(:cart => current_cart, :track => @track, :unit_price => @track.price)
		flash[:notice] = "Added #{@track.name} to cart"
		redirect_to current_cart
	end
end