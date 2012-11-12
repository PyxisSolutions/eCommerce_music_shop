# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  band_id    :integer
#

class Track < ActiveRecord::Base
  attr_accessible :band_id, :name, :song, :remote_song_url
  belongs_to :band
  mount_uploader :song, SongUploader

  before_create :default_name

  def default_name
	self.name ||= File.basename(song.filename, '.*')#.titleize  	
  end
end
