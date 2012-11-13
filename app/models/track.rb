# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  band_id    :integer
#  song       :string(255)
#  name       :string(255)
#  album_id   :integer
#  image_url  :string(255)
#

class Track < ActiveRecord::Base
  attr_accessible :band_id, :name, :image_url

  belongs_to :band

  belongs_to :album

  # mount_uploader :song, SongUploader

  before_create :default_name

  def default_name
	self.name ||= File.basename(image_url, '.*')#.titleize  	
  end
end
