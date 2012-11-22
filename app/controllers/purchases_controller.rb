class PurchasesController < ApplicationController
	def index
		@tracks = current_account.user.tracks.paginate(page: params[:page], per_page: 10)
	end
end
