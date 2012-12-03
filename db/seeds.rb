["standard_user", "band", "admin"].each do |role|
	Role.find_or_create_by_name(role)
end

r = Right.new
r.name = "index users"
r.controller = "users"
r.action = "index"
r.save

r = Right.new
r.name = "delete users"
r.controller = "users"
r.action = "delete"
r.save

r = Right.new
r.name = "delete bands"
r.controller = "bands"
r.action = "delete"
r.save

r = Right.new
r.name = "index bands"
r.controller = "bands"
r.action = "index"
r.save

r = Right.new
r.name = "show bands"
r.controller = "bands"
r.action = "show"
r.save

r = Right.new
r.name = "new tracks"
r.controller = "tracks"
r.action = "new"
r.save

r = Right.new
r.name = "show tracks"
r.controller = "tracks"
r.action = "show"
r.save

r = Right.new
r.name = "create tracks"
r.controller = "tracks"
r.action = "create"
r.save

r = Right.new
r.name = "download tracks"
r.controller = "tracks"
r.action = "download"
r.save

r = Right.new
r.name = "create line_items"
r.controller = "line_items"
r.action = "create"
r.save

r = Right.new
r.name = "show cart"
r.controller = "carts"
r.action = "show"
r.save

r = Right.new
r.name = "paypal express checkout"
r.controller = "paypal_express"
r.action = "checkout"
r.save

r = Right.new
r.name = "confirm purchase"
r.controller = "paypal_express"
r.action = "confirm"
r.save

r = Right.new
r.name = "take payment"
r.controller = "paypal_express"
r.action = "purchase"
r.save

r = Right.new
r.name = "show users"
r.controller = "users"
r.action = "show"
r.save

r = Right.new
r.name = "view purchases"
r.controller = "purchases"
r.action = "index"
r.save

r = Right.new
r.name = "delete bands"
r.controller = "bands"
r.action = "destroy"
r.save

[4, 5, 7, 9, 10, 11, 12, 13, 14, 15, 16].each do |i|
	role = Role.find_by_name("standard_user")
	role.rights << Right.find_by_id(i)
	role.save
end

[5, 6, 7, 8, 17].each do |i|
	role = Role.find_by_name("band")
	role.rights << Right.find_by_id(i)
	role.save
end

[1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17].each do |i|
	role = Role.find_by_name("admin")
	role.rights << Right.find_by_id(i)
	role.save
end
