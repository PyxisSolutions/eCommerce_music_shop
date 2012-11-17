class AddPriceToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :price, :decimal
  end
end
