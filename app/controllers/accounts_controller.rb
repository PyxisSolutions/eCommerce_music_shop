class AccountsController < ApplicationController
	skip_before_filter	:check_authorization

	def newUser
		@account = Account.new
		@account.user = User.new
	end

	def createUser
		@account = Account.new(params[:account])
		@account.roles << Role.find_by_name("standard_user")
		if @account.save
			sign_in @account
			flash[:success] = "Welcome to Sample App!"
  			redirect_to root_path
  		else
  			render 'newUser'
  		end
	end
	
	def newBand
		@account = Account.new
		@account.band = Band.new
	end

	def createBand
		@account = Account.new(params[:account])
		@account.roles << Role.find_by_name("band")
		if @account.save
			flash[:success] = @account.band.name + " added to the website!"
  			redirect_to root_path
  		else
  			render 'newBand'
  		end
	end

end
