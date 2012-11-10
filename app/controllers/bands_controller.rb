class BandsController < ApplicationController
	def index
		@bands = Band.paginate(page: params[:page], per_page: 10)
	end

	def show
		@band = Band.find(params[:id])
		@tracks = @band.tracks.paginate(page: params[:page])
	end
end
