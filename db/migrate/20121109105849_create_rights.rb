class CreateRights < ActiveRecord::Migration
  def change
    create_table :rights do |t|
	  t.column "name", :string
	  t.column "controller", :string
	  t.column "action", :string
    end
  end
end
