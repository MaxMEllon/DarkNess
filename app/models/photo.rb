# == Schema Information
#
# Table name: photos
#
#  id         :integer          not null, primary key
#  album_id   :integer
#  page       :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  img_path   :string
#

class Photo < ActiveRecord::Base
  belongs_to :album
end
