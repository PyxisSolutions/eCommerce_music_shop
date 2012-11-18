class AddUserIdAndTrackIdToPurchases < ActiveRecord::Migration
  def change
    add_column :purchases, :user_id, :integer
    add_column :purchases, :track_id, :integer
  end
end
