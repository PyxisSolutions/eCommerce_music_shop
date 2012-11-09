class AccountsController < ApplicationController
	def new
		@account = Account.new
	end

	def create
		@account = Account.new(params[:account])
		if :account.save
			flash[:success] = "Welcome to Sample App!"
  			redirect_to root_path
  		else
  			render 'new'
  		end
	end
	
end
