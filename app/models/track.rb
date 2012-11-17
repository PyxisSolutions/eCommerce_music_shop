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
#  file_type  :string(255)
#  price      :decimal(, )
#

class Track < ActiveRecord::Base
  attr_accessible :band_id, :name, :image_url

  belongs_to :band

  belongs_to :album

  # mount_uploader :song, SongUploader

  before_create :default_name
  before_create :default_file_type
  # before_create :set_title
  before_create :default_price
  # before_create :before_validation
  
  def default_name
    self.name ||= File.basename(image_url, '.*')#.titleize  	
  end

  def default_file_type
    self.file_type ||= File.extname(image_url)
  end

  def set_title
    self.title ||= self.name.humanize
  end

  def default_price
    self.price ||= 0.79
  end

  # def before_validation
  # 	  self.audio_content_type = FileMagic.new(FileMagic::MAGIC_MIME).file(self.audio.to_file.path).gsub(/\n/,"").split(";").first

  # end

end
