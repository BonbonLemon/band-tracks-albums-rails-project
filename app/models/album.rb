# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  band_id    :integer
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ActiveRecord::Base

  belongs_to :band,
  foreign_key: :band_id,
  primary_key: :id,
  class_name: "Band"

  has_many :tracks,
  dependent: :destroy,
  foreign_key: :album_id,
  primary_key: :id,
  class_name: "Track"
end
