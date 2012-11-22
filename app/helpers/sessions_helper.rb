module SessionsHelper
	def sign_in(account)
		cookies.permanent[:remember_token] = account.remember_token
		self.current_account = account
	end

	def signed_in?
		!current_account.nil?
	end

	def current_account=(account)
		@current_account = account
	end

	def current_account
		@current_account ||= Account.find_by_remember_token(cookies[:remember_token])
	end

	def current_account?(account)
		account == current_account
	end

	def signed_in_account
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in"
      end
    end

	def sign_out
		self.current_account = nil
		cookies.delete(:remember_token)
	end

	def redirect_back_or(default)
		redirect_to(session[:return_to] || default)
		session.delete(:return_to)
	end

	def store_location
		session[:return_to] = request.url
	end

	def admin?
		current_account.roles.detect{ |role| role.name == "admin" }
	end

	def band?
		current_account.band
	end

	def standard_user?
		current_account.user
	end

	def sign_in_create_account
      unless !signed_in?
        flash[:error] = "You already have an account"
        redirect_to(root_path)
      end
    end

    def correct_account
      @account = Account.find(params[:id])
      redirect_to(root_path) unless current_account?(@account) || admin?
    end

    def correct_band
    	@band = current_account.band
    	redirect_to(root_path) unless current_band?(@band) || admin?
    end

    def allow_upload?
    	@account = Band.find(params[:id])
    	current_band?(@account) || admin?
    end

    def current_band?(band)
    	band == current_account.band
    end

end
