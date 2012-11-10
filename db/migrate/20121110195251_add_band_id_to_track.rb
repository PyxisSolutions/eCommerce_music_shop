class AddBandIdToTrack < ActiveRecord::Migration
  def change
    add_column :tracks, :band_id, :integer
  end
end
