class SessionsController < ApplicationController
	skip_before_filter	:check_authorization
	
	def new
	end

	def create
		#render 'new'
		account = Account.find_by_email(params[:email].downcase)
		if account && account.authenticate(params[:password])
			sign_in(account)
			redirect_to root_url
		else
			flash.now[:error] = "Invalid email/password combination"
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to root_url
	end
end
