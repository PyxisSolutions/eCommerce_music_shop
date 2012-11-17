module TracksHelper

	def number_to_currency_gbp(number)
		number_to_currency(number, { :unit => "&pound;" })
	end

end
