# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  lyrics     :text             not null
#  album_id   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Track < ActiveRecord::Base
  validates :title, :lyrics, :album_id, presence: true

  belongs_to :album,
  foreign_key: :album_id,
  primary_key: :id,
  class_name: "Album"

  has_one :band,
  through: :album,
  source: :band
end
