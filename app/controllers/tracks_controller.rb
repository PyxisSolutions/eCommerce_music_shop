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


		establish_connection
		@url = AWS::S3::S3Object.url_for("uploads/" + @track.name + @track.file_type, 'ecommerce_music_shop')
	end

	private
		def establish_connection
			AWS::S3::Base.establish_connection!(
				:access_key_id		=> 'AKIAJ4TPEHBSQQPIMGHA',
				:secret_access_key	=> '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'
			)
		end

end
