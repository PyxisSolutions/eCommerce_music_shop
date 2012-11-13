class TracksController < ApplicationController

	def new
		@track = Track.new(:band_id => params[:band_id])
	end

	def create
		@band = Band.find(session[:band_id])
		@track = @band.tracks.create(params[:track])
		

		# @track = Track.new(params[:track])
		# if @track.save
		# 	flash[:notice] = "Successfully created track"
		# 	redirect_to @track.band
		# else
		# 	render 'new'
		# end
	end

	def destroy
		
	end

	def show
		@track = Track.find(params[:id])
	end
end
