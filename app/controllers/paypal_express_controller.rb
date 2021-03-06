class PaypalExpressController < ApplicationController

	def checkout
		setup_response = gateway.setup_purchase(current_cart.total_price*100,
			:ip => request.remote_ip,
			:return_url => url_for(:action => 'confirm', :only_path => false),
			:cancel_return_url => url_for(:controller => 'bands', :action => 'index', :only_path => false)
		)
		redirect_to gateway.redirect_url_for(setup_response.token)
	end

	def confirm
		customer_details = gateway.details_for(params[:token])
		session[:tokenID] = params[:token]
		session[:payerID] = params[:PayerID]
		if !customer_details.success?
			@message = details_response.message
			flash[:notice] = @message
			return
		end

		@address = customer_details.address
	end

	def purchase
		purchase = gateway.purchase(current_cart.total_price*100,
			:ip => request.remote_ip,
			:token => session[:tokenID],
			:payer_id => session[:payerID]
		)

		if purchase.success?
			notice = "Thanks! Your purchase is complete!"
			add_to_purchased_list
			session[:tokenID] = nil
			session[:payerID] = nil
			current_cart.purchased_at = Time.now
			session[:cart_id] = nil
			reset_session
		else
			notice = "Something went wrong. Paypal says: #{purchase.message}"
		end

		redirect_to root_url, :notice => notice

	end

	private
		def gateway
			@gateway ||= ActiveMerchant::Billing::PaypalExpressGateway.new(
				:login => "sbutte_1353179924_biz_api1.dundee.ac.uk",
				:password => "1353179946",
				:signature => "AKlXxHry-.fFIRzFOUtVan9dO4qXAsMTGGGKGXBzD4I6KLT9VA72Kvki"
			)
		end

		def add_to_purchased_list
			current_cart.line_items.each do |line_item| 
				current_account.user.purchases.create(track_id: line_item.track.id)
			end
		end

end