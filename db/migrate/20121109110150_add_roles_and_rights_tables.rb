class AddRolesAndRightsTables < ActiveRecord::Migration
  def up
  	create_table :roles_accounts, :id => false do |t|
  		t.column "role_id", :integer
  		t.column "account_id", :integer
  	end

  	create_table :rights_roles, :id => false do |t|
  		t.column "right_id", :integer
  		t.column "role_id", :integer
  	end
  end

  def down
  	drop_table :roles_accounts
  	drop_table :roles
  	drop_table :rights
  	drop_table :rights_roles
  end
end
