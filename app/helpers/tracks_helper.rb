module TracksHelper

	def purchased?(track)
		if current_account.user.tracks.include?(track)
			return true
		else 
			return false
		end
	end

	def number_to_currency_gbp(number)
		number_to_currency(number, { :unit => "&pound;" })
	end

end
