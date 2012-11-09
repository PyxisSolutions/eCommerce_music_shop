class UsersController < ApplicationController
	def new
		#@account = Account.new
		@user = User.new
		@user.account = Account.new
		@user.account << Role.find_by_name("standard_user")
	end

	def create
		#@account = Account.new(params[:account])
		# @user = @account.tasks.build(params[:user])
		@user = User.new(params[:user])

		if @user.save
			sign_in @user.account
			flash[:success] = "Welcome to Sample App!"
  			redirect_to root_path
  		else
  			render 'new'
  		end
	end

	def edit
	end

	def update

	end



end
