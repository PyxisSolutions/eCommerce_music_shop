class AddFileTypeToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :file_type, :string
  end
end
