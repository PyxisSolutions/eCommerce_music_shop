class BandsController < ApplicationController

	before_filter :correct_user, only: [:update]

	def index
		# reset_session
		@bands = Band.paginate(page: params[:page], per_page: 10)
	end

	def show
		@band = Band.find(params[:id])
		@tracks = @band.tracks.paginate(page: params[:page], per_page: 10)
	end

	def update
		if @band.update_attributes(params[:band])
			flash[:success] = "Successfully updated"
			if !admin?
				sign_in @band.account
			end
		else
			flash[:error] = "Something went wrong..."
		end
		redirect_to @band
	end

	private
		def correct_user
			@band = Band.find(params[:id])
			redirect_to(root_path) unless current_band?(@band) || admin?
		end

end
