# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  name       :string           default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Event < ActiveRecord::Base
  has_many :albums
  belongs_to :user
end
