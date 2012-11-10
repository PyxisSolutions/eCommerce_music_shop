namespace :db do
	desc "Add roles and associated rights"
	task populate: :environment do
		Role.create!(name: "standard_user")
		Role.create!(name: "band")
		Role.create!(name: "admin")
	end
end