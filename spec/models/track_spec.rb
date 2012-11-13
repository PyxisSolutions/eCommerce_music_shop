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

require 'spec_helper'

describe Track do
  pending "add some examples to (or delete) #{__FILE__}"
end
