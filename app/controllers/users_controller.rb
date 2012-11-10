class UsersController < ApplicationController

	def index
		@users = User.paginate(page: params[:page], per_page: 10)
	end

	def destroy
		@user = User.find(params[:id])

		if @user.account.roles.find("admin")
			flash[:error] = "Admin users cannot be deleted"
			redirect_to root_path
		else
			@user.destroy
			flash[:success] = "User destroyed"
			redirect_to users_url
		end
	end

end
