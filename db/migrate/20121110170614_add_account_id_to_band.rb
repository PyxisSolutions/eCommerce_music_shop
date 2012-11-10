class AddAccountIdToBand < ActiveRecord::Migration
  def change
    add_column :bands, :account_id, :integer
  end
end
