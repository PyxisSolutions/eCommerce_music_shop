class AccountsController < ApplicationController
	skip_before_filter	:check_authorization

	def newUser
		#@account = Account.new
		# @user = User.new
		# @user.account = Account.new
		#@user.account << Role.find_by_name("standard_user")
		@account = Account.new
		@account.user = User.new
	end

	def create
		@account = Account.new(params[:account])
		if @account.save
			sign_in @account
			flash[:success] = "Welcome to Sample App!"
  			redirect_to root_path
  		else
  			render 'new'
  		end
	end
	
end
