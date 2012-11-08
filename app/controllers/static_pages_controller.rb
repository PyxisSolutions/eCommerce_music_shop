class StaticPagesController < ApplicationController
	skip_before_filter	:check_authorization

	def home
	end

	def help
	end

	def about
	end

	def contact
	end
end
