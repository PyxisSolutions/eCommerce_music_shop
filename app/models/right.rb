# == Schema Information
#
# Table name: rights
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  controller :string(255)
#  action     :string(255)
#

class Right < ActiveRecord::Base
  # attr_accessible :title, :body
  has_and_belongs_to_many :roles
end
