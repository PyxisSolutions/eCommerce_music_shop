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
  # attr_accessible :title, :body
  belongs_to :band
end
